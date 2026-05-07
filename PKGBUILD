# Maintainer: tim <iunstable0@proton.me>
pkgname=klear
_pkgname=klear
pkgver=r66.da6d692
pkgrel=1
pkgdesc='A minimal Hyprland status bar in Kotlin/Native (tray, popup menus, battery, glassy refraction)'
arch=('x86_64')
url='https://codeberg.org/goal10der/klearShell'
license=('MIT')
depends=(
  'wayland'
  'mesa'
  'libglvnd'
  'glibc'
  'pam'
)
optdepends=(
  'hyprland: the compositor klear is designed for'
  'ttf-dejavu: fallback font if AdwaitaSans is unavailable'
)
makedepends=(
  'git'
  'gcc'
  'kotlin-native-bin'
  'wayland-protocols'
)
source=(
  "$_pkgname::git+$url.git"
  'nanovg::git+https://github.com/memononen/nanovg.git'
)
sha256sums=('SKIP' 'SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$_pkgname"
  rm -rf lib/nanovg
  ln -sfT "$srcdir/nanovg" lib/nanovg
}

build() {
  cd "$srcdir/$_pkgname"
  make
}

package() {
  cd "$srcdir/$_pkgname"
  make DESTDIR="$pkgdir" PREFIX=/usr install
}
