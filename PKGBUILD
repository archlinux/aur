# Maintainer: Filippo Berto <berto.f@protonmail.com>
_reponame=ndn-cxx
_pkgname=ndn-cxx
pkgname=${_pkgname}
pkgver=0.7.1
pkgrel=1
# epoch=
pkgdesc="Library implementing Named Data Networking (NDN) primitives that can be used to write various NDN applications"
arch=('i686' 'x86_64')
url="https://github.com/named-data/${_reponame}"
license=('GPL')
groups=()
depends=('boost' 'sqlite' 'openssl>=1.0.2')
makedepends=('git' 'python' 'doxygen' 'python-sphinx')
checkdepends=()
optdepends=('boost-stacktrace-backtrace')
provides=("${pkgname}")
conflicts=("${pkgname}")
replaces=()
backup=()
options=()
install=
source=(https://github.com/named-data/${_reponame}/archive/${_reponame}-${pkgver}.tar.gz)
noextract=()
sha256sums=('8105558b95c7989d5211ffc101dfde2182d981542a348f0566d580ff6c4623c9')
validpgpkeys=()

prepare() {
	cd "${srcdir}/${_reponame}-${_reponame}-${pkgver}"
	./waf configure --prefix=/usr --with-tests
}

build() {
  cd "${srcdir}/${_reponame}-${_reponame}-${pkgver}"
	./waf build
  ./waf docs
}

# Check disabled until upstream gets fixed
#check() {
#  cd "${srcdir}/${_reponame}-${_reponame}-${pkgver}"
#  ./waf install --destdir="${srcdir}/tests"
#  LD_LIBRARY_PATH="${srcdir}/tests/usr/lib" ./build/unit-tests
#}

package() {
  install -dm 755 "${pkgdir}/usr/share/doc/$_pkgname"

	cd "${srcdir}/${_reponame}-${_reponame}-${pkgver}"
	./waf install --destdir="${pkgdir}"
  cp -r "${srcdir}/${_reponame}-${_reponame}-${pkgver}/build/docs/"* "${pkgdir}/usr/share/doc/$_pkgname"
  mv "${pkgdir}/usr/etc" "${pkgdir}/"
}
