# Maintainer: Cedric Girard <cgirard [dot] archlinux [at] valinor [dot] fr>
# Contributor: blue_lizard lizard@blue.dyn-o-saur.com

pkgname=mmv
pkgver=2.10
pkgrel=1
pkgdesc="multiple move files"
source=(
  https://github.com/rrthomas/mmv/releases/download/v${pkgver}/mmv-${pkgver}.tar.gz
)
sha256sums=('2bbba14c099b512b4a7e9effacec53caa06998069d108a5669ff424ffc879d03')

url="https://github.com/rrthomas/mmv"
license=(GPL-2.0-or-later)
install=$pkgname.install
arch=('i686' 'x86_64')

prepare() {
  cd "${srcdir}/$pkgname-$pkgver"
  ./configure --prefix /usr
}

build() {
  cd "${srcdir}/$pkgname-$pkgver"
  make
}

package(){
  cd "${srcdir}/$pkgname-$pkgver"
  mkdir -p "${pkgdir}/usr/bin"
  mkdir -p "${pkgdir}/usr/share/man/man1"
  make DESTDIR="${pkgdir}" install
  chmod 644 "${pkgdir}/usr/share/man/man1/mmv.1"
}
