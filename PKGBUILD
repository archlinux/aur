# Maintainer: willemw <willemw12@gmail.com>
# Contributor: Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>

pkgname=html2text-cpp
pkgver=2.2.2
pkgrel=1
pkgdesc='HTML to text rendering aimed for E-mail'
arch=(x86_64)
url=https://github.com/grobian/html2text
license=(GPL2)
#depends=(gcc-libs)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('ee464d8d23e3727fcc87e0064417119bb5646ca8dfbccea0a569e7379184b42d')

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
