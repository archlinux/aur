# Maintainer: willemw <willemw12@gmail.com>
# Contributor: Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>

pkgname=html2text-cpp
pkgver=2.2.3
pkgrel=1
pkgdesc='HTML to text rendering aimed for E-mail'
arch=(x86_64)
url=https://github.com/grobian/html2text
license=(GPL2)
#depends=(gcc-libs)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('29e4b04e7cc7b9b6acb7db76edf4739d3a72a672f37452267e707d40249520ee')

build() {
  cd "${pkgname%-cpp}-$pkgver"
  autoreconf -f -i
  ./configure
  make
}

package() {
  cd "${pkgname%-cpp}-$pkgver"
  #make DESTDIR="$pkgdir" install
  install -Dm755 html2text     "$pkgdir/usr/bin/$pkgname"
  install -Dm644 html2text.1   "$pkgdir/usr/share/man/man1/$pkgname.1"
  install -Dm644 html2textrc.5 "$pkgdir/usr/share/man/man5/${pkgname}rc.5"
}
