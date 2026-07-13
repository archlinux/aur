# Maintainer: Hajos Attila <linux[dot]alucard[at]gmail[dot]com>

pkgname=sunshine-beta-bin
_pkgname=sunshine-beta-bin
pkgver=2026.712.223218
_gittag=v$pkgver
pkgrel=1
pkgdesc="A self-hosted game stream host for Moonlight"
url="https://app.lizardbyte.dev"
source=(
  "$_pkgname-$pkgver.pkg.tar.zst"::"https://github.com/LizardByte/Sunshine/releases/download/$_gittag/sunshine-$pkgver-1-x86_64.pkg.tar.zst"
  "$_pkgname-$pkgver.desktop"::"https://github.com/LizardByte/Sunshine/blob/master/packaging/linux/dev.lizardbyte.app.Sunshine.desktop"
  "sunshine-capabilities.hook"
  "sunshine-beta-bin.install"
)
arch=('x86_64')
license=('GPL-3.0-only')
depends=(
  'avahi'
  'curl'
  'libayatana-appindicator'
  'libcap'
  'libdrm'
  'libevdev'
  'libpipewire'
  'miniupnpc'
  'libmfx'
  'libnotify'
  'libpulse'
  'libva'
  'libx11'
  'libxcb'
  'libxfixes'
  'libxrandr'
  'libxtst'
  'numactl'
  'openssl'
  'opus'
  'udev'
  'vulkan-icd-loader'
  'which'
  'qt6-base'
)
optdepends=(
  'cuda: Nvidia GPU encoding support'
  'libva-mesa-driver: AMD GPU encoding support'
  'xorg-server-xvfb: Virtual X server for headless testing'
)
install=sunshine-beta-bin.install
conflicts=('sunshine' 'sunshine-git' 'sunshine-bin')
replaces=('sunshine-bin')
provides=('sunshine-bin')
sha256sums=(
  '154c2fe9bd0bc1a3cc34efd9f62bdc39927fa6465bae7f2634b70239350dd5ce'
  'SKIP'
  'f0ec806b7922e48bb7127046cf4b72f907220fb5ad136b72cdb1af3239c3a963'
  '7d135a13d5690569080ab7eb5553580cc6bd115586f6a0d4bb7324a3a22c87d9'
)

package() {
  if [[ -f "usr/bin/sunshine-v$pkgver" ]]; then
    install -Dm755 "usr/bin/sunshine-v$pkgver" "$pkgdir/usr/bin/sunshine"
  elif [[ -f "usr/bin/sunshine-$pkgver" ]]; then
    install -Dm755 "usr/bin/sunshine-$pkgver" "$pkgdir/usr/bin/sunshine"
  else
    install -Dm755 "usr/bin/sunshine" "$pkgdir/usr/bin/sunshine"
  fi

  cp -r "usr/lib" "$pkgdir/usr"
  cp -r "usr/share" "$pkgdir/usr" 2>/dev/null || true

  install -Dm644 "$srcdir/sunshine-capabilities.hook" \
    "$pkgdir/usr/share/libalpm/hooks/sunshine-capabilities.hook"
}
