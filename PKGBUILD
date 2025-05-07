# Maintainer: Pierre Carru <pierre@carru.fr>

pkgname=elecwhat-bin
_pkgname=elecwhat
pkgver=1.5.0
pkgrel=1
pkgdesc="Simple desktop Whatsapp client"
arch=('x86_64')
url="https://github.com/piec/elecwhat/"
license=('GPL-3.0-only')
depends=('electron36')
conflicts=('elecwhat')
options=(!strip)
source=(
  elecwhat
  "https://github.com/piec/elecwhat/releases/download/v${pkgver}/elecwhat-${pkgver}.pacman"
)
sha256sums=('8b8da3bd9ce00f1fd6a746685d996217d7dc03220471eaeff6c600408f5fd378'
            'd51fee5f80613bc9d224c803642773b92f5bcf737d84744ea1e396e8ec1d0721')

package() {
  cd "$srcdir"

  install -Dm755 "$_pkgname" "$pkgdir"/usr/bin/elecwhat

  install -dm0755 "$pkgdir"/usr/lib/elecwhat
  install -Dm644  "opt/$_pkgname/resources/app.asar" "$pkgdir"/usr/lib/$_pkgname/app.asar

  sed -i 's|Exec=/opt/elecwhat/elecwhat|Exec=/usr/bin/elecwhat|' usr/share/applications/elecwhat.desktop
  install -Dm644  "usr/share/applications/elecwhat.desktop" "$pkgdir"/usr/share/applications/elecwhat.desktop

  find "usr/share/icons" -type f -exec install -Dm644 {,"$pkgdir"/}{} \;
}
