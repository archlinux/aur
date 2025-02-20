# Maintainer: JarzaClay <icdubs09+aur at gmail dot com>

_pkgname=lucem
pkgname=lucem-git
pkgdesc='a wrapper for Sober on Linux, git version'
pkgver=2.1.2.r6.g6b5dcce
pkgrel=4
arch=('x86_64')
url='https://github.com/xTrayambak/lucem'
license=('MIT')
source=('lucem::git+https://github.com/xTrayambak/lucem.git#branch=master')
sha256sums=('SKIP')
makedepends=(
  'git'
  'nim'
)
depends=(
  'curl'
  'libx11'
  'libglvnd'
  'graphene'
  'libxkbcommon'
  'libxcursor'
  'cairo'
  'libadwaita'
  'gdk-pixbuf2'
  'harfbuzz'
  'libxext'
  'glib2'
  'glibc'
  'pango'
  'vulkan-icd-loader'
  'gtk4'
  'wayland'
)

install="$pkgname.install"

pkgver() {
  cd "$_pkgname"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_pkgname"
  nimble build
}

package() {
  cd "$srcdir/$_pkgname"
  
  install -Dm755 "$srcdir/$_pkgname/lucem" "$pkgdir/usr/bin/lucem"
  install -Dm755 "$srcdir/$_pkgname/lucemd" "$pkgdir/usr/bin/lucemd"
  install -Dm755 "$srcdir/$_pkgname/lucem_overlay" "$pkgdir/usr/bin/lucem_overlay"
  
  install -Dm644 "$srcdir/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$srcdir/$_pkgname/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}

