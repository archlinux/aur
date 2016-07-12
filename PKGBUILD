# Maintainer : Remy van Elst
# https://raymii.org

pkgname=sc-hsm-embedded-git
pkgver=2.9
pkgrel=1
pkgdesc="sc-hsm-embedded pkcs#11 library by CardContact"
arch=('any')
url="https://github.com/CardContact/sc-hsm-embedded"
license=('bsd')

depends=('automake' 'libtool' 'libusb' 'pcsclite')
makedepends=('git')
provides=("${pkgname%-VCS}")
conflicts=("${pkgname%-VCS}")
replaces=()
backup=()
options=()
install=
source=('sc-hsm-embedded::git+https://github.com/CardContact/sc-hsm-embedded')
noextract=()
md5sums=('SKIP')

prepare() {
  cd "$srcdir/${pkgname%-git}"
  libtoolize --force
  aclocal
  automake --force-missing --add-missing
  autoconf
}

build() {
  cd "$srcdir/${pkgname%-git}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/${pkgname%-git}"
  make DESTDIR="$pkgdir/" install
}