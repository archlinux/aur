# Contributor: Dave Reisner <d@falconindy.com>

pkgname=expac-git
pkgver=9.2.g6be7fe1
pkgrel=1
pkgdesc="pacman database extraction utility"
arch=('i686' 'x86_64')
url="http://github.com/falconindy/expac"
license=('MIT')
depends=('pacman')
makedepends=('git' 'meson' 'perl')
conflicts=('expac')
provides=('expac')
source=('git://github.com/falconindy/expac.git')
md5sums=('SKIP')

pkgver() {
  cd expac

  git describe | sed 's/-/./g'
}

build() {
  cd expac

  [[ -d build ]] && meson_args+=(--wipe)

  meson build "${meson_args[@]}"
  ninja -C build
}

package() {
  cd expac

  DESTDIR=$pkgdir ninja -C build install
}

# vim: ft=sh syn=sh et
