# Maintainer: Geequlim <geequlim at gmail dot com>
pkgname=thirtyfile-bin
pkgver=1.1.0
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
sha256sums=('c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4' '49c051c46182a5ff2deaa3127a794ef3960a2ef7dfab229b5348e8e6c3932df2' '0bb4a0d1b7ddfa1e1cfc63dac968f98b3d44d5595d23f4204be93391c1216e88' '405fd58517be07ff8fd74c26d5c8507280af9b787e526d90d9281556b5059d91' '0e71c018bb6e44e3ae4bd423222b7af0d2e246192221ddc7d5bfad3f71628e5f')
source_x86_64=("https://github.com/ThirtyFile/ThirtyFile/releases/download/v${pkgver}/thirtyfile-${pkgver}-linux-amd64")
sha256sums_x86_64=('5fa4aa8e44a2407c214a1f0d58d3b448283425f397f609709401afbe6555251b')
source_aarch64=("https://github.com/ThirtyFile/ThirtyFile/releases/download/v${pkgver}/thirtyfile-${pkgver}-linux-arm64")
sha256sums_aarch64=('8fc8ed2a8990f779a138b10af34383b8bef89595293da6a856afd2c160fcd532')
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
