# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

_pkgname=goatcounter
pkgname=$_pkgname-bin
pkgver=2.6.0
pkgrel=1
pkgdesc='Easy web analytics in go. No tracking of personal data.'
arch=('x86_64' 'armv7h' 'aarch64')
license=("LicenseRef-$_pkgname") # modified EUPL
url="https://$_pkgname.com"
provides=("$_pkgname")
conflicts=("$_pkgname")
install=$_pkgname.install
source=("https://github.com/arp242/$_pkgname/raw/refs/tags/v$pkgver/LICENSE"
        "$_pkgname.service" "tmpfiles.conf" "sysusers.conf")
source_x86_64=("https://github.com/arp242/$_pkgname/releases/download/v$pkgver/$_pkgname-v$pkgver-linux-amd64.gz")
source_armv7h=("https://github.com/arp242/$_pkgname/releases/download/v$pkgver/$_pkgname-v$pkgver-linux-arm.gz")
source_aarch64=("https://github.com/arp242/$_pkgname/releases/download/v$pkgver/$_pkgname-v$pkgver-linux-arm64.gz")
sha256sums=('0ebcd9c1b45363198921aeff0dd7f2b03bbcab69b285951b08dd9a1a1182abe8'
            'c424f059b47da38213f32431ea71b4d70f3c03da8e8c460253bd5a000caf86d1'
            '6239cada3130289eb5fe1930eff441277ab2d941e928a92623da921b779e8799'
            'a82c94b09c613a69feaefcaa80dcaac7bb780ffc8e336a16d08878e402b8c361')
sha256sums_x86_64=('af79361739e6a2eb0b7e539950f6ea42bb1aafb0a8e294ab41782df40cd806cc')
sha256sums_armv7h=('052717e8c873becd064bb09648387ecec9c8fdc3914fef438b6e1f7912ccf739')
sha256sums_aarch64=('2590e7dc9ea206bcbf345cfd5c2f631ebeac52b0d82ceede5625864d5ddc8103')

package() {
  _exe=$_pkgname-v$pkgver-linux
  case "$CARCH" in
    x86_64) _exe+=-amd64 ;;
    armv7h) _exe+=-arm ;;
    aarch64) _exe+=-arm64 ;;
    *) msg2 "Unknown \$CARCH $CARCH!" ; exit 1 ;;
  esac
  install -Dm755 $_exe "$pkgdir/usr/bin/$_pkgname"

  install -Dm644 tmpfiles.conf "$pkgdir/usr/lib/tmpfiles.d/$_pkgname.conf"
  install -Dm644 sysusers.conf "$pkgdir/usr/lib/sysusers.d/$_pkgname.conf"
  install -Dm644 $_pkgname.service "$pkgdir/usr/lib/systemd/system/$_pkgname.service"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
