# Maintainer: lmartinez
pkgname=fnott-git
pkgver=1.0.1.r2.g5845372
pkgrel=2
pkgdesc="Keyboard-driven and lightweight Wayland notification daemon"
arch=('x86_64')
url="https://codeberg.org/dnkl/fnott"
license=('MIT')
depends=('dbus' 'fcft' 'wlroots')
makedepends=('git' 'meson' 'scdoc' 'wayland-protocols' 'tllist')
provides=('fnott')
conflicts=('fnott')
source=("$pkgname::git+$url")
md5sums=('SKIP')

pkgver()  {
  cd "$pkgname"
  git describe --long | sed 's/-/.r/;s/-/./'
}

build() {
  cd "$pkgname"
  meson --prefix=/usr --buildtype=release --wrap-mode=nofallback -Db_lto=true build
  ninja -C build
}

package() {
  cd "$pkgname"
  DESTDIR="$pkgdir/" ninja -C build install
  install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
