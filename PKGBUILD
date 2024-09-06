# Maintainer: Andrew Scott <aur at andyscott dot me>
_pkgname=fyi
pkgname="${_pkgname}-git"
pkgver=1.0.4.r1.7fccc96
pkgrel=1
pkgdesc='A command line utility and notify-send alternative to send desktop notifications'
arch=(x86_64)
url="https://codeberg.org/dnkl/${_pkgname}"
license=(MIT)
depends=(dbus)
makedepends=(git meson ninja scdoc)
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("${_pkgname}::git+${url}.git")
b2sums=(SKIP)

pkgver() {
  cd "$_pkgname"
  git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g'
}

build() {
  cd "$_pkgname"
  arch-meson . build
  meson compile -C build
}

package() {
  cd "$_pkgname"
  meson install -C build --destdir "$pkgdir"
  install -Dm0644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}
