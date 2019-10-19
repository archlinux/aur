# Maintainer: Bruce Zhang
pkgname=postman
pkgver=7.9.0
pkgrel=1
pkgdesc='Build, test, and document your APIs faster'
arch=('x86_64')
url='https://www.getpostman.com/downloads/'
license=('custom:Postman EULA')
depends=('electron4')
provides=('postman')
conflicts=('postman-bin')
options=('!strip')
source_x86_64=(
  "$pkgname-$pkgver-x86_64.orig.tar.gz::https://dl.pstmn.io/download/version/$pkgver/linux64"
)
source=(
  "EULA.pdf::https://www.getpostman.com/terms/Postman_EULA_May_2018.pdf"
  "postman.desktop"
  "postman.sh"
)
sha256sums=('bbc2f4a8db8fa55d854f7fe4a41339dd02522b7e77879fc7b6796819bceb9a33'
            'cf4b62b0fccdec77a24abc350a03082a521fc1bc533feb1781e83a4a170424b2'
            '25045b9c1748b29a359017d7cd0052d62798d9217900c1db94edf259ed1592ac')
sha256sums_x86_64=('fcdec0125fa6e2d2674ef93fcc7b4abbfb604ffcdd7de05f502c25dd761dfc61')

package() {
  cd "$srcdir/Postman/app/resources/app"

  # Install Postman app resource
  find . -type f -exec install -Dm644 {} "$pkgdir/usr/share/postman/app/{}" \;

  # Install bin
  install -Dm755 "$srcdir/postman.sh" "$pkgdir/usr/bin/postman"

  # Install desktop
  install -Dm755 "$srcdir/postman.desktop" "$pkgdir/usr/share/applications/postman.desktop"

  # Install icons & eula
  install -Dm644 "$srcdir/Postman/app/resources/app/assets/icon.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/postman.png"
  install -Dm644 "$srcdir/EULA.pdf" "$pkgdir/usr/share/licenses/postman/EULA.pdf"
}
