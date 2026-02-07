# Maintainer: Pierre Carru <pierre@carru.fr>

pkgname=elecwhat-bin
_pkgname=elecwhat
pkgver=1.13.4
pkgrel=1
pkgdesc="Simple desktop Whatsapp client"
arch=('x86_64')
url="https://github.com/piec/elecwhat/"
license=('GPL-3.0-only')
depends=('electron37')
conflicts=('elecwhat')
options=(!strip)
source=(
  elecwhat
  "https://github.com/piec/elecwhat/releases/download/v${pkgver}/elecwhat-${pkgver}.pacman"
)
sha256sums=('253626db788c9013d48ce2e4c4b3bf8b1bb709d9427e523bfbed520d3f3377e1'
            'a197d66e99d060b0d2104755cdfac22e81fcb58836a66634c727ca5d034f1f57')

package() {
  cd "$srcdir"

  install -Dm755 "$_pkgname" "$pkgdir"/usr/bin/elecwhat

  install -dm0755 "$pkgdir"/usr/lib/elecwhat
  install -Dm644  "opt/$_pkgname/resources/app.asar" "$pkgdir"/usr/lib/$_pkgname/app.asar
  cp -a "opt/$_pkgname/resources/app.asar.unpacked" "$pkgdir"/usr/lib/$_pkgname/app.asar.unpacked

  sed -i 's|Exec=/opt/elecwhat/elecwhat|Exec=/usr/bin/elecwhat|' usr/share/applications/elecwhat.desktop
  install -Dm644  "usr/share/applications/elecwhat.desktop" "$pkgdir"/usr/share/applications/elecwhat.desktop

  find "usr/share/icons" -type f -exec install -Dm644 {,"$pkgdir"/}{} \;
}
