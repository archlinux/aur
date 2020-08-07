# Maintainer: Filippo Berto <berto.f@protonmail.com>
_reponame=mini-ndn
_pkgname=mini-ndn
pkgname=${_pkgname}-git
pkgver=v0.4.0.r34.g76dbe66
pkgrel=1
# epoch=
pkgdesc="Lightweight networking emulation tool that enables testing, experimentation, and research on the NDN platform based on Mininet"
arch=('i686' 'x86_64')
url="https://github.com/named-data/${_reponame}"
license=('GPL')
groups=()
depends=('boost' 'ndn-cxx' 'ndn-nfd' 'ndn-chronosync' 'ndn-tools' 'ndn-nlsr' 'ndn-infoedit' 'mininet' 'termshark' 'python-igraph' 'python-setuptools')
makedepends=('git')
checkdepends=()
optdepends=()
provides=("${_pkgname}")
conflicts=("${_pkgname}")
replaces=()
backup=()
options=()
install=
source=("git+${url}.git")
noextract=()
sha256sums=('SKIP')
validpgpkeys=()

pkgver() {
	cd "${srcdir}/${_reponame}"
	git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${_reponame}"
  mkdir -p "${srcdir}/output"
  python3 setup.py build
}

package() {
  install -dm 755 "${pkgdir}/usr/local/etc/mini-ndn/"

	cd "${srcdir}/${_reponame}" 
  cp topologies/*.conf "${pkgdir}/usr/local/etc/mini-ndn/"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
