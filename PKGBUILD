# Maintainer: bonnie https://codeberg.org/b0nn133

pkgname=wliconrun
pkgver=2026.03.15.r3.g40c244b
pkgrel=1
pkgdesc="A CLI utility for launching applications with custom icons in Wayland environments (KDE Plasma, GNOME, Sway, Hyprland)."
arch=('x86_64' 'aarch64')
url="https://codeberg.org/b0nn133/wliconrun"
license=('MIT')
depends=('desktop-file-utils' 'glibc')
makedepends=('make' 'gcc' 'pkg-config' 'git')
source=("$pkgname::git+https://codeberg.org/b0nn133/wliconrun.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  
  local commit_date=$(git log -1 --format=%cd --date=format:%Y.%m.%d)
  
  local commit_count=$(git rev-list --count HEAD)
  
  local commit_hash=$(git rev-parse --short HEAD)
  
  echo "${commit_date}.r${commit_count}.g${commit_hash}"
}

build() {
  cd "$srcdir/$pkgname"
  make
}

package() {
  cd "$srcdir/$pkgname"
  
  install -Dm755 wliconrun "$pkgdir/usr/bin/wliconrun"
  
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
