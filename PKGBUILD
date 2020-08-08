# Maintainer: Filippo Berto <berto.f@protonmail.com>
_reponame=ChronoSync
_pkgname=ndn-chronosync
pkgname=${_pkgname}
pkgver=0.5.3
pkgrel=5
# epoch=
pkgdesc="Synchronization library for distributed realtime applications for NDN"
arch=('i686' 'x86_64')
url="https://github.com/named-data/${_reponame}"
license=('GPL')
groups=()
depends=('boost' 'ndn-cxx')
makedepends=('git' 'python' 'doxygen' 'python-sphinx')
checkdepends=()
optdepends=()
provides=("${pkgname}")
conflicts=("${pkgname}")
replaces=()
backup=()
options=()
install=
source=(https://github.com/named-data/${_reponame}/archive/${pkgver}.tar.gz)
noextract=()
sha256sums=('2ac5ad83026f7ed13abfffd25197a1d999f2e5eef9e9dd39b519d68d817d3071')
validpgpkeys=()

prepare() {
	cd "${srcdir}/${_reponame}-${pkgver}"
	./waf configure --prefix=/usr --with-tests
}

build() {
  cd "${srcdir}/${_reponame}-${pkgver}"
	./waf build
  ./waf docs
}

check() {
  cd "${srcdir}/${_reponame}-${pkgver}"
  ./waf install --destdir="${srcdir}/tests"
  LD_LIBRARY_PATH="${srcdir}/tests/usr/lib" ./build/unit-tests
}

package() {
	install -dm 755 "${pkgdir}/usr/share/doc/ndn-chronosync"

  cd "${srcdir}/${_reponame}-${pkgver}"
	./waf install --destdir="${pkgdir}"
  cp -r "${srcdir}/${_reponame}-${pkgver}/build/docs/"* "${pkgdir}/usr/share/doc/ndn-chronosync"
}
