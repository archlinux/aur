# Maintainer: Alexander F Rødseth <rodseth@gmail.com>
# Contributor: tobias <tobias@archlinux.org>
# Contributor: Tobias Kieslich <tobias@justdreams.de>

pkgname=monica
pkgver=3.7
pkgrel=6
pkgdesc='Monitor calibration tool'
arch=('x86_64')
url='https://sources.archlinux.org/other/monica/'
license=('BSD')
depends=('fltk' 'xorg-xgamma')
makedepends=('gendesk')
source=("https://sources.archlinux.org/other/monica/$pkgname-$pkgver.tar.bz2"
        'monica.png')
sha512sums=('87565f33f3c3492b196905e5b8e17bd45a7eb8eb0a0281f02e23337eec888af82571ac6f2d229256ee97012d402b7f1b217cd56a8b87ff9c9296931bf63cb153'
            '1a839c9481528dcb785011417a0b77d925b3ae373c6d5fd4a48bab89091c2508079988db38e9dd21e8ed6922c8178b5f3c05beec455deba94ad304b85b990670')

prepare() {
  cd "$pkgname-$pkgver"

  gendesk -f -n --pkgname "$pkgname" --pkgdesc "$pkgdesc" \
    --categories 'Application;Settings;System'
}

build() {
  make -C "$pkgname-$pkgver"
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$pkgname.desktop" \
    "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 "$srcdir/$pkgname.png" \
    "$pkgdir/usr/share/pixmaps/$pkgname.png"
  install -Dm644 licence "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
