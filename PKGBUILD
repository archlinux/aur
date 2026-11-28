# Maintainer: Geequlim <geequlim at gmail dot com>
pkgname=thirtyfile-bin
pkgver=1.4.0
pkgrel=1
pkgdesc='Self-hosted file manager with a Windows File Explorer-style web interface'
arch=('x86_64' 'aarch64')
url='https://github.com/Geequlim/aur-packages/tree/main/packages/thirtyfile-bin'
license=('Apache-2.0')
depends=('ca-certificates' 'tzdata')
provides=("thirtyfile=${pkgver}")
conflicts=('thirtyfile')
backup=('etc/thirtyfile/thirtyfile.conf')
options=('!strip' '!debug')
source=(
  "LICENSE-${pkgver}::https://github.com/ThirtyFile/ThirtyFile/releases/download/v${pkgver}/LICENSE"
  "THIRD-PARTY-NOTICES-${pkgver}::https://github.com/ThirtyFile/ThirtyFile/releases/download/v${pkgver}/THIRD-PARTY-NOTICES"
  'thirtyfile.service'
  'thirtyfile.conf'
  'thirtyfile.sysusers'
)
sha256sums=('c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4' 'c52f473870a3de1cd69bd0c1bfdaa9f7ab9311b0dad67faafce0d503b10c7558' '0bb4a0d1b7ddfa1e1cfc63dac968f98b3d44d5595d23f4204be93391c1216e88' '405fd58517be07ff8fd74c26d5c8507280af9b787e526d90d9281556b5059d91' '0e71c018bb6e44e3ae4bd423222b7af0d2e246192221ddc7d5bfad3f71628e5f')
source_x86_64=("https://github.com/ThirtyFile/ThirtyFile/releases/download/v${pkgver}/thirtyfile-${pkgver}-linux-amd64")
sha256sums_x86_64=('8e2b7bb47ef51e3f61988e95af4699f2cb89ab7d52ee65984ab87595a7647c34')
source_aarch64=("https://github.com/ThirtyFile/ThirtyFile/releases/download/v${pkgver}/thirtyfile-${pkgver}-linux-arm64")
sha256sums_aarch64=('9a09ceb9ad9d6e317a07725b9f7fef89108e2cfe7946446d7997bbb650509f80')
noextract=("thirtyfile-${pkgver}-linux-amd64" "thirtyfile-${pkgver}-linux-arm64")

package() {
  local upstream_arch
  case "$CARCH" in
    x86_64) upstream_arch=amd64 ;;
    aarch64) upstream_arch=arm64 ;;
  esac
  install -Dm755 "$srcdir/thirtyfile-${pkgver}-linux-${upstream_arch}" "$pkgdir/usr/bin/thirtyfile"
  install -Dm644 "$srcdir/LICENSE-${pkgver}" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$srcdir/THIRD-PARTY-NOTICES-${pkgver}" "$pkgdir/usr/share/licenses/$pkgname/THIRD-PARTY-NOTICES"
  install -Dm644 "$srcdir/thirtyfile.service" "$pkgdir/usr/lib/systemd/system/thirtyfile.service"
  install -Dm644 "$srcdir/thirtyfile.sysusers" "$pkgdir/usr/lib/sysusers.d/thirtyfile.conf"
  install -Dm644 "$srcdir/thirtyfile.conf" "$pkgdir/etc/thirtyfile/thirtyfile.conf"
}
