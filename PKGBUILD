# Maintainer: Haram Choi <altitudinem at google dot com>
pkgname=linux-fireface-mixer-bin
_pkgname=linux-fireface-mixer
pkgver=0.4.0
pkgrel=1
pkgdesc="GUI mixer and headless OSC daemon for RME Fireface 400 on Linux (Pre-compiled binary)"
arch=('x86_64')
url="https://github.com/oudeis01/linux-fireface-mixer"
license=('GPL3')
depends=('alsa-lib' 'libx11' 'libxrandr' 'libxinerama' 'libxcursor' 'libxi' 'systemd-libs' 'liblo' 'snd-firewire-ctl-services')
optdepends=('linux-totalmix-web-remote: web remote control from phones/tablets over the LAN')
provides=("$_pkgname")
conflicts=("$_pkgname")

source_x86_64=("totalmixer_gui-x86_64-$pkgver::${url}/releases/download/v${pkgver}/totalmixer_gui-x86_64"
               "totalmixer-x86_64-$pkgver::${url}/releases/download/v${pkgver}/totalmixer-x86_64")
source=("LICENSE-$pkgver::${url}/raw/v${pkgver}/LICENSE"
        "README-$pkgver.md::${url}/raw/v${pkgver}/README.md"
        "README-kr-$pkgver.md::${url}/raw/v${pkgver}/README-kr.md"
        "totalmixer-daemon-$pkgver.service::${url}/raw/v${pkgver}/packaging/totalmixer-daemon.service")

sha256sums=('3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986'
            '7f81a66303943bb202ab6d93a8a84087ec5673d8e877ba6856d3e426d60a6089'
            'eae3c1a9e4fbf9d84785b989f6b8947ee1657be7e4bf048edde49c08d614f898'
            '1bc163b47ba6ac07a89816d1cb4f09a01b0ec2ef7977f22fb92979c37f95b663')
sha256sums_x86_64=('31306716ab061fdadd7d6ff7095dd2116c525e9c4488052400d745a25443d801'
                   '00422c3b7ace6e3b6dc65c99352a145d5a2e7d0614e4f302188d65b53cc1322e')

package() {
  install -Dm755 "$srcdir/totalmixer_gui-x86_64-$pkgver" "$pkgdir/usr/bin/totalmixer_gui"
  install -Dm755 "$srcdir/totalmixer-x86_64-$pkgver" "$pkgdir/usr/bin/totalmixer"

  install -Dm644 "$srcdir/totalmixer-daemon-$pkgver.service" \
      "$pkgdir/usr/lib/systemd/user/totalmixer-daemon.service"

  install -Dm644 "$srcdir/LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$srcdir/README-$pkgver.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 "$srcdir/README-kr-$pkgver.md" "$pkgdir/usr/share/doc/$pkgname/README-kr.md"
}
