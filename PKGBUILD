# Maintainer: a821 at mail de
# Contributor: Dave Reisner <d@falconindy.com>

pkgname=expac-git
pkgver=10.r1.gab14fef
pkgrel=1
pkgdesc="pacman database extraction utility"
arch=('x86_64')
url="https://github.com/falconindy/expac"
license=('MIT')
depends=('pacman')
makedepends=('git' 'meson' 'perl')
conflicts=('expac')
provides=('expac')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd expac
  git describe | sed 's/-/.r/;s/-/./g'
}

prepare() {
  sed 's/^.\*.\?//;/DEALINGS/q' expac/src/expac.c > LICENSE
}

build() {
  arch-meson expac build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

# vim: ft=sh syn=sh et
