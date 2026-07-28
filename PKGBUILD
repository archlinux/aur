# Maintainer: Haram Choi <altitudinem at google dot com>
pkgname=linux-fireface-mixer-bin
_pkgname=linux-fireface-mixer
pkgver=0.3.0
pkgrel=1
pkgdesc="GUI mixer and headless OSC daemon for RME Fireface 400 on Linux (Pre-compiled binary)"
arch=('x86_64')
url="https://github.com/oudeis01/linux-fireface-mixer"
license=('GPL3')
depends=('alsa-lib' 'libx11' 'libxrandr' 'libxinerama' 'libxcursor' 'libxi' 'systemd-libs' 'liblo' 'snd-firewire-ctl-services')
optdepends=()
provides=("$_pkgname")
conflicts=("$_pkgname")

source_x86_64=("totalmixer_gui-x86_64-$pkgver::${url}/releases/download/v${pkgver}/totalmixer_gui-x86_64"
               "totalmixer_cli-x86_64-$pkgver::${url}/releases/download/v${pkgver}/totalmixer_cli-x86_64"
               "totalmixer-daemon-x86_64-$pkgver::${url}/releases/download/v${pkgver}/totalmixer-daemon-x86_64")
source=("LICENSE-$pkgver::${url}/raw/v${pkgver}/LICENSE"
        "README-$pkgver.md::${url}/raw/v${pkgver}/README.md"
        "README-kr-$pkgver.md::${url}/raw/v${pkgver}/README-kr.md"
        "totalmixer-daemon-$pkgver.service::${url}/raw/v${pkgver}/packaging/totalmixer-daemon.service")

sha256sums=('3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986'
            'a62dd1a668f4a8dae47cfa45020827b004a219efce29f3cd4b3dc85aaef4c5df'
            '22320fa154cdc22e2ee57c57fef30a9f3ce6ac4c06882d6b31bee41c81025583'
            'ed648a86ce691fd71fb03700b52fd51be6202612a218006fdd0ad322ed1769c7')
sha256sums_x86_64=('5c7fd7cb5ed6b97e9cd191fd737c9be248bc0dbfe3d37d8467c870be4c9051ea'
                   'e8bbcbb99bcbc3eab338b473011b5f9bd41f3efe568c7aec81331f0903ade819'
                   '36c73f647c9a6ab118a3873267283c2725438d6df6487fd3d30a2aff02b9ea7b')

package() {
  install -Dm755 "$srcdir/totalmixer_gui-x86_64-$pkgver" "$pkgdir/usr/bin/totalmixer_gui"
  install -Dm755 "$srcdir/totalmixer_cli-x86_64-$pkgver" "$pkgdir/usr/bin/totalmixer_cli"
  install -Dm755 "$srcdir/totalmixer-daemon-x86_64-$pkgver" "$pkgdir/usr/bin/totalmixer-daemon"

  install -Dm644 "$srcdir/totalmixer-daemon-$pkgver.service" \
      "$pkgdir/usr/lib/systemd/user/totalmixer-daemon.service"

  install -Dm644 "$srcdir/LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$srcdir/README-$pkgver.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 "$srcdir/README-kr-$pkgver.md" "$pkgdir/usr/share/doc/$pkgname/README-kr.md"
}
