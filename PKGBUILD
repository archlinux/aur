# Maintainer: Matilde Morrone <aur at morrone dot dev>

pkgname=shinyfetch-git
pkgver=r21.9fcba1c
pkgrel=1
pkgdesc="The shiniest hardware fetch"
arch=('x86_64' 'aarch64')
url="https://github.com/morr0ne/shinyfetch"
license=('Apache-2.0')
groups=('shinyfetch')
depends=('erlang-nox')
makedepends=('git' 'cargo' 'just' 'gleam' 'rebar3')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/morr0ne/shinyfetch.git')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	just build-release
}

package() {
	cd "$srcdir/${pkgname%-git}"
	just DESTDIR="$pkgdir/" install
}
