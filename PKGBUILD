# Maintainer: Filippo Berto <berto.f@protonmail.com>
_reponame=PSync
_pkgname=ndn-psync
pkgname=$_pkgname
pkgver=0.2.0
pkgrel=3
# epoch=
pkgdesc="Library implementing Named Data Networking (NDN) primitives that can be used to write various NDN applications"
arch=('i686' 'x86_64')
url="https://github.com/named-data/${_reponame}"
license=('GPL')
groups=()
depends=('boost' 'ndn-cxx')
makedepends=('git' 'python' 'doxygen' 'python-sphinx')
checkdepends=()
optdepends=()
provides=("${_pkgname}")
conflicts=("${_pkgname}")
replaces=()
backup=()
options=()
install=
source=(https://github.com/named-data/${_reponame}/archive/${pkgver}.tar.gz)
noextract=()
sha256sums=('ab18f2f17df48bfc4b6baa064a826d8f1c3b1e464748a2106f47decd69183b02')
validpgpkeys=()

prepare() {
  cd "${srcdir}/${_reponame}-${pkgver}"
  ./waf configure --prefix=/usr
}

build() {
	cd "${srcdir}/${_reponame}-${pkgver}"
	./waf build
  ./waf docs
}

package() {
  install -dm 755 "${pkgdir}/usr/share/doc/ndn-psync"

  cd "${srcdir}/${_reponame}-${pkgver}"
  ./waf install --destdir="${pkgdir}"
  cp -r "${srcdir}/${_reponame}-${pkgver}/build/docs/"* "${pkgdir}/usr/share/doc/ndn-psync"
}

