# Maintainer: Adam Nielsen <malvineous@shikadi.net>
# Co-maintainer: w568w <w568w at outlook dot com>

pkgname=micron-storage-executive-cli
_execname='msecli'
pkgver=11.01.012025.00
pkgrel=2
pkgdesc="Micron Storage Executive Command Line (msecli) for configuring and managing Micron SSDs"
arch=(x86_64 aarch64)
url="https://www.micron.com/sales-support/downloads/software-drivers/storage-executive-software#cli"
license=('LicenseRef-SLA')
provides=("$_execname")
depends=('glibc')
makedepends=()
optdepends=()
source=("SLA")
source_x86_64=(
  "$pkgname-$pkgver-x86_64.run::https://assets.micron.com/adobe/assets/urn:aaid:aem:f60bf728-a665-4760-b099-31631a1f02bc/renditions/original/as/msecli-linux.run"
)
source_aarch64=(
  "$pkgname-$pkgver-aarch64.zip::https://assets.micron.com/adobe/assets/urn:aaid:aem:3faea2e9-b3dd-4e12-9320-02299b15b646/renditions/original/as/msecli-arm.zip"
)
sha256sums=('7b385cd18e9b747cf76ac5999dd01768c2931358f6da2751cdb8745d6dde32c7')
sha256sums_x86_64=('bad5db025873c929becdc2a5abec3bf796f03d8496ef1667640db5f2483c88d7')
sha256sums_aarch64=('f862f13cf3112dd0075cc7db4dca4546effac06d9515acbfbdb22e92e6f19f7d')

package() {
	case "$CARCH" in
    x86_64)
      install -Dm755 "$srcdir/$pkgname-$pkgver-x86_64.run" "$pkgdir/usr/bin/$_execname"
      ;;
    aarch64)
      install -Dm755 "$srcdir/msecli-arm" "$pkgdir/usr/bin/$_execname"
      ;;
    *)
      echo "Unsupported architecture: $CARCH"
      return 1
      ;;
  esac
  install -Dm644 "$srcdir/SLA" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
