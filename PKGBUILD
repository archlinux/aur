# Maintainer: willemw <willemw12@gmail.com>
# Contributor: lmartinez

pkgname=fnott-git
pkgver=1.4.1.r4.g222ca03
pkgrel=1
pkgdesc='Keyboard driven and lightweight Wayland notification daemon'
arch=(x86_64)
url=https://codeberg.org/dnkl/fnott
license=(MIT)
depends=(dbus fcft wlroots)
makedepends=(git meson scdoc tllist wayland-protocols)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url.git")
md5sums=('SKIP')

pkgver()  {
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
  meson install -C $pkgname/build --destdir "$pkgdir"
  install -Dm0644 $pkgname/LICENSE -t "$pkgdir/usr/share/licenses/${pkgname%-git}"
}
