# Maintainer: Your Name <your.email@example.com>

pkgname=unused-pkg-remover
pkgver=1.2.0
pkgrel=3
pkgdesc="GUI tool to find and remove unused Arch Linux packages — orphans, pacman cache, Flatpak runtimes, broken packages, AUR build deps, Steam/Proton junk, and more"
arch=('any')
url="https://github.com/dressedinblack5/unused-pkg-remover"
license=('MIT')
depends=(
  'python'
  'pyside6'
  'pacman'
  'expac'
  'polkit'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-wheel'
  'python-setuptools'
)
optdepends=(
  'flatpak: Flatpak runtime cleaning'
  'yay: AUR cache cleaning and orphan removal'
  'paru: AUR cache cleaning and orphan removal'
  'steam: Steam/Proton cleaning'
  'lutris: Stale launcher runner cleaning'
  'heroic-games-launcher: Stale launcher runner cleaning'
  'bottles: Stale launcher runner cleaning'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/dressedinblack5/$pkgname/archive/main.tar.gz"
        "unused-pkg-remover.desktop")
sha256sums=('6ec196f88a0961de21385b20dc9f1012786e01365992a65f5aecc2d7f305dc85'
            'bd62afefea6bd0fa7b89ff4a1878097b59eb0bc272d89d11000887af02a313c7')

build() {
  cd "$srcdir/$pkgname-main"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$pkgname-main"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 assets/unused-pkg-remover.png \
    "$pkgdir/usr/share/pixmaps/unused-pkg-remover.png"
  install -Dm644 assets/unused-pkg-remover.png \
    "$pkgdir/usr/share/icons/hicolor/128x128/apps/unused-pkg-remover.png"
  install -Dm644 "$srcdir/unused-pkg-remover.desktop" \
    "$pkgdir/usr/share/applications/unused-pkg-remover.desktop"
}
