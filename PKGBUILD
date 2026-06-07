# Maintainer: Sync1211 <dpf12110@gmail.com>
pkgname=owovrc-cli-bin
pkgver=beta7
pkgrel=4
pkgdesc="Yet another VRChat integration for the OWO Skin haptic vest."
arch=('x86_64')
url="https://github.com/sync1211/owoskin-vrc"
license=('GPL-3.0-or-later')
depends=()
makedepends=('unzip')
#makedepends=('git' 'dotnet-sdk-10.0')
provides=('OWOVRC.CLI')
conflicts=('owovrc-cli')
source=(
#  "git+$url.git#tag=V1.0-beta7"
  'https://github.com/sync1211/owoskin-vrc/releases/download/V1.0-beta7/linux64.zip'
  'owovrc-cli.desktop'
  'owovrc-256x256.png'
  'owovrc-128x128.png'
  'owovrc-64x64.png'
  'owovrc-32x32.png'
)
sha256sums=(
  'c6c4b943b594ac852de2a5ba15a2a04b16498c6cad6177cc2f40afdbb4bca313'
  'dd893c8b0852163fe16497a8662dac9324270f388fd988c51727aa24731d12a0'
  '1420bbf64c57cba914b7f5eb89e9b6191feb294726aec291f3571295ee0b06a9'
  '944e88525cfd75ea76392832adba591835a49d7998e63bd4a7efb080b8fdbc51'
  '53da2613bbd99b8e0ae5daf24a896caab13e803c6f2953d69cf9ee321b201eac'
  '2f9078c1f2502a4dd42ee48022687388c4773e4305ada671a0c91abcb67b98aa'
  )
options=('!debug' '!strip')

build() {
  unzip -u linux64.zip
}

package() {
  install -Dm755 "$srcdir/OWOVRC.CLI" -t "$pkgdir/usr/bin/"

 for size in "256" "128" "64" "32"; do
  install -Dm644 "$srcdir/owovrc-${size}x${size}.png" "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/owovrc.png"
 done

 install -Dm644 "owovrc-cli.desktop" "$pkgdir/usr/share/applications/owovrc-cli.desktop"
}
