# Maintainer: Andrew Scott <aur at andyscott dot me>
_pkgname=fyi
pkgname="${_pkgname}-git"
pkgver=1.0.3.r7.905ec0b
pkgrel=1
pkgdesc="A command line utility and notify-send alternative to send desktop notifications"
arch=('any')
url='https://codeberg.org/dnkl/fyi'
license=('MIT')
depends=('dbus')
makedepends=('git' 'meson' 'ninja' 'scdoc')
provides=('fyi')
conflicts=('fyi')
source=("${_pkgname}::git+${url}.git")
b2sums=('SKIP')

pkgver() {
  git -C "$_pkgname" describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g'
}

build() {
  export CFLAGS="${CFLAGS} -fno-exceptions"
  arch-meson "$_pkgname" "${_pkgname}/build"
  meson compile -C "${_pkgname}/build"
}

package() {
  meson install -C "${_pkgname}/build" --destdir "$pkgdir"
  install -Dm0644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
