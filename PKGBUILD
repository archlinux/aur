# Maintainer: Lucas Santos <hello@lsantos.dev>
# pkgver and sha256sums are rewritten by .github/workflows/release.yml on every tag.
# The tarballs are built by the same workflow and attached to the GitHub release.
pkgname=opensynapse-bin
pkgver=0.2.3
pkgrel=1
pkgdesc="Remap buttons, set DPI and lighting on Razer mice from Linux (prebuilt)"
arch=('x86_64' 'aarch64')
url="https://github.com/khaosdoctor/opensynapse"
license=('GPL-2.0-or-later')
depends=('gcc-libs' 'glibc' 'libxkbcommon' 'wayland' 'libglvnd')
optdepends=('xdg-desktop-portal: file picker for profile import/export in the GUI')
provides=('opensynapse')
conflicts=('opensynapse')
source_x86_64=("$url/releases/download/v$pkgver/opensynapse-$pkgver-x86_64.tar.gz")
source_aarch64=("$url/releases/download/v$pkgver/opensynapse-$pkgver-aarch64.tar.gz")
sha256sums_x86_64=('498e0b5df774a49aebda0493ea60ef7fc31c2ba14c3d505491335a6cc1d75cff')
sha256sums_aarch64=('e6dcf673e861d3588691c0fd742d61afd81c669dbd172e39d5fb0efc0076d258')

package() {
  cd "opensynapse-$pkgver"
  install -Dm755 opensynapse "$pkgdir/usr/bin/opensynapse"
  install -Dm755 opensynapse-gui "$pkgdir/usr/bin/opensynapse-gui"
  install -Dm644 udev/70-opensynapse.rules "$pkgdir/usr/lib/udev/rules.d/70-opensynapse.rules"
  install -Dm644 assets/opensynapse.desktop "$pkgdir/usr/share/applications/opensynapse.desktop"
  install -Dm644 assets/icon.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/opensynapse.svg"
  install -Dm644 assets/icon.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/opensynapse.png"
  install -Dm644 README.md "$pkgdir/usr/share/doc/opensynapse/README.md"
  install -Dm644 PROTOCOL.md "$pkgdir/usr/share/doc/opensynapse/PROTOCOL.md"
  install -Dm644 -t "$pkgdir/usr/share/doc/opensynapse/protocols" devices/protocols/*.md
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  # releases before 0.2.2 have no completions in the tarball
  if [ -d completions ]; then
    install -Dm644 completions/opensynapse.bash "$pkgdir/usr/share/bash-completion/completions/opensynapse"
    install -Dm644 completions/_opensynapse "$pkgdir/usr/share/zsh/site-functions/_opensynapse"
    install -Dm644 completions/opensynapse.fish "$pkgdir/usr/share/fish/vendor_completions.d/opensynapse.fish"
  fi
}
