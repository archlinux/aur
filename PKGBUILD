# Maintainer: Jason Landbridge <JasonLandbridge at aur dot archlinux dot org>
# Packaging repository: https://github.com/JasonLandbridge/Arch-Linux-AUR-Packages-Updater/tree/main/chrome-for-testing-bin

pkgname=chrome-for-testing-bin
pkgver=156.0.8078.80 # renovate: datasource=custom.chrome-for-testing depName=chrome-for-testing versioning=loose
pkgrel=1
pkgdesc="Official Google Chrome for Testing browser"
arch=('x86_64')
url="https://googlechromelabs.github.io/chrome-for-testing/"
license=('LicenseRef-Google-Chrome')
depends=(
  'alsa-lib'
  'at-spi2-core'
  'cairo'
  'dbus'
  'expat'
  'glib2'
  'glibc'
  'gtk3'
  'libcups'
  'libx11'
  'libxcb'
  'libxcomposite'
  'libxdamage'
  'libxext'
  'libxfixes'
  'libxkbcommon'
  'libxrandr'
  'libxss'
  'libxtst'
  'mesa'
  'nspr'
  'nss'
  'pango'
  'systemd-libs'
  'ttf-liberation'
  'xdg-utils'
)
options=('!emptydirs' '!strip')
source=(
  "chrome-for-testing-${pkgver}-linux64.zip::https://storage.googleapis.com/chrome-for-testing-public/${pkgver}/linux64/chrome-linux64.zip"
)
sha256sums=('b711c720f774be355197f32edf37e0651418ba036d92446ee2da19ac017540a7')

package() {
  local _install_dir="$pkgdir/opt/chrome-for-testing"

  install -dm755 "$_install_dir"
  cp -a "$srcdir/chrome-linux64/." "$_install_dir/"
  chmod 0755 "$_install_dir/chrome_sandbox"
  chmod 0644 "$_install_dir/deb.deps" "$_install_dir/rpm.deps"

  install -Dm755 /dev/stdin "$pkgdir/usr/bin/chrome-for-testing" <<'EOF'
#!/usr/bin/env bash
exec /opt/chrome-for-testing/chrome "$@"
EOF

  install -Dm644 "$srcdir/chrome-linux64/ABOUT" \
    "$pkgdir/usr/share/licenses/$pkgname/ABOUT"
  install -Dm644 "$srcdir/chrome-linux64/WidevineCdm/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/WidevineCdm-LICENSE"
}
