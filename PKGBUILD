# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

_pkgname=goatcounter
pkgname=$_pkgname-bin
pkgver=2.7.0
pkgrel=1
pkgdesc='Easy web analytics in go. No tracking of personal data.'
arch=('x86_64' 'aarch64')
license=("LicenseRef-$_pkgname") # modified EUPL
url="https://$_pkgname.com"
provides=("$_pkgname")
conflicts=("$_pkgname")
install=$_pkgname.install
source=("https://github.com/arp242/$_pkgname/raw/refs/tags/v$pkgver/LICENSE"
        "$_pkgname.service" "tmpfiles.conf" "sysusers.conf")
source_x86_64=("https://github.com/arp242/$_pkgname/releases/download/v$pkgver/$_pkgname-v$pkgver-linux-amd64.gz")
source_aarch64=("https://github.com/arp242/$_pkgname/releases/download/v$pkgver/$_pkgname-v$pkgver-linux-arm64.gz")
sha256sums=('cfaff7a8e4c3998ed24b07e9cfa026b5d264d734b3a08909a859cf40f4844e93'
            'f49b1da5dd4102c25a536ea229fee791cec59a579ea148fd408464d723017ed1'
            '6239cada3130289eb5fe1930eff441277ab2d941e928a92623da921b779e8799'
            'a82c94b09c613a69feaefcaa80dcaac7bb780ffc8e336a16d08878e402b8c361')
sha256sums_x86_64=('98d221cb9c8ef2bf76d8daa9cca647839f8d8b0bb5bc7400ff9337c5da834511')
sha256sums_aarch64=('ff5b2670b858bbe48802dfdc74130b6dcde2de9f5c1229b838eb9132769307dd')

package() {
  _exe=$_pkgname-v$pkgver-linux
  case "$CARCH" in
    x86_64) _exe+=-amd64 ;;
    aarch64) _exe+=-arm64 ;;
    *) msg2 "Unknown \$CARCH $CARCH!" ; exit 1 ;;
  esac
  install -Dm755 $_exe "$pkgdir/usr/bin/$_pkgname"

  install -Dm644 tmpfiles.conf "$pkgdir/usr/lib/tmpfiles.d/$_pkgname.conf"
  install -Dm644 sysusers.conf "$pkgdir/usr/lib/sysusers.d/$_pkgname.conf"
  install -Dm644 $_pkgname.service "$pkgdir/usr/lib/systemd/system/$_pkgname.service"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
