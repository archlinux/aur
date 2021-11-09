# Maintainer:
# Contributor: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: kappa <kappacurve@gmail.com>

pkgname=erlang-sdl
pkgver=1.3.1
pkgrel=4
arch=('x86_64')
pkgdesc='SDL and OpenGL bindings for Erlang'
url='https://github.com/dgud/esdl/'
license=(custom)
depends=(erlang glu libgl sdl)
makedepends=(git mesa-libgl rebar)
#tag=esdl-1.3.1 fails
source=("esdl::git+$url#commit=dbd8ce9228aa")
md5sums=('SKIP')

prepare() {
  find esdl -type f -exec chmod 644 {} \;
}

build() {
  cd esdl
  CFLAGS="$CFLAGS -Wno-deprecated-declarations" rebar compile
}

package() {
  cd esdl
  install -d "$pkgdir/usr/lib/erlang/lib/esdl-$pkgver"
  cp -ruv c_src doc ebin include priv src \
    "$pkgdir/usr/lib/erlang/lib/esdl-$pkgver/"
  install -Dm644 license.terms "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
