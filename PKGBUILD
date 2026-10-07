# Contributor: David Barri <japgolly@gmail.com>
# Maintainer: Bink
pkgname=atomicwallet
pkgver=2.104.8
pkgrel=2
pkgdesc="Crypto wallet for buying, staking and swapping over 1000+ coins and tokens."
arch=('x86_64')
url="https://atomicwallet.io"
license=('LicenseRef-AtomicWallet')
depends=(
  alsa-lib
  at-spi2-core
  atk
  cairo
  dbus
  expat
  gcc-libs
  glib2
  glibc
  gtk3
  hicolor-icon-theme
  libcups
  libx11
  libxcb
  libxcomposite
  libxdamage
  libxext
  libxfixes
  libxkbcommon
  libxrandr
  mesa
  nspr
  nss
  pango
  systemd-libs
)
options=('!debug')
source=("https://releases.atomicwallet.io/AtomicWallet-$pkgver.rpm")
b2sums=('86f4aac4c79d876bda29e0a9fbd1bc2310293421cea38b3be8b4327945a74063216f01f24f11573a82652ab13dc6df019127c349533f7a62f119ecdc3c8be7a8')

package() {
  mv opt usr "$pkgdir"

  install -d "$pkgdir/usr/bin"
  ln -s "../../opt/Atomic Wallet/atomic" "$pkgdir/usr/bin/atomicwallet"

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  cat > "$pkgdir/usr/share/licenses/$pkgname/LICENSE" <<'EOF'
Atomic Wallet is proprietary, closed-source freeware from atomicwallet.io.
Use of the software is subject to the terms published at
https://atomicwallet.io
EOF

  # Third-party licences shipped with the bundled Electron runtime.
  install -Dm644 "$pkgdir/opt/Atomic Wallet/LICENSE.electron.txt" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE.electron.txt"
  install -Dm644 "$pkgdir/opt/Atomic Wallet/LICENSES.chromium.html" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSES.chromium.html"
}
