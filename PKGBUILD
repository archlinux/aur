# Maintainer: willemw <willemw12@gmail.com>
# Contributor: lmartinez

pkgname=fnott-git
pkgver=1.7.1.r16.ge3fad6e
pkgrel=1
pkgdesc='Keyboard driven and lightweight Wayland notification daemon'
arch=(x86_64)
url=https://codeberg.org/dnkl/fnott
license=(MIT)
depends=(dbus fcft wayland)
makedepends=(git meson scdoc tllist wayland-protocols)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  git -C $pkgname describe --long --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  arch-meson $pkgname $pkgname/build
  meson compile -C $pkgname/build
}

check() {
  meson test -C $pkgname/build
}

package() {
  install -Dm0644 $pkgname/LICENSE -t "$pkgdir/usr/share/licenses/${pkgname%-git}"
  meson install -C $pkgname/build --destdir "$pkgdir"
}
