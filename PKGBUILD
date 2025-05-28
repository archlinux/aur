# Maintainer: Qomarul Hasan <mail at qomarhsn.com>

pkgname=evolve-core-bin
pkgver=1.7
pkgrel=1
pkgdesc="Modern GTK Theme Manager for GNOME (binary release)"
arch=('x86_64')
url="https://github.com/arcnations-united/evolve-core"
license=('Apache-2.0')
depends=('gtk4' 'webkit2gtk' 'libadwaita')
source=(
  "https://github.com/arcnations-united/evolve-core/releases/download/v${pkgver}/EvolveCore-v${pkgver}.zip"
  "evolve-core.desktop"
)
sha256sums=('SKIP' 'SKIP')

package() {
  # Install binary files into /opt
  install -d "$pkgdir/opt/evolve-core"
  bsdtar -xf "${srcdir}/EvolveCore-v${pkgver}.zip" -C "$pkgdir/opt/evolve-core"

  # Symlink executable to /usr/bin
  install -d "$pkgdir/usr/bin"
  ln -s "/opt/evolve-core/evolvecore" "$pkgdir/usr/bin/evolve-core"

  # Install .desktop entry
  install -Dm644 "${srcdir}/evolve-core.desktop" "$pkgdir/usr/share/applications/evolve-core.desktop"

  # Install application icon
  install -Dm644 "$pkgdir/opt/evolve-core/iconfile.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/evolve-core.png"
}

