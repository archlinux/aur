# Maintainer: Julius Schumacher <juliusschumacher@gmail.com>
pkgname=erlang_ls-git
pkgver=r704.9eb3e93
pkgrel=1
pkgdesc="Erlang Language Server Protocol Implementation"
arch=(x86_64)
url="https://github.com/erlang-ls/erlang_ls"
license=('Apache')
groups=()
depends=(erlang rebar3)
makedepends=('git') # 'bzr', 'git', 'mercurial' or 'subversion'
provides=("${pkgname%-VCS}")
conflicts=("${pkgname%-VCS}")
replaces=()
backup=()
options=()
install=
source=('git+https://github.com/erlang-ls/erlang_ls')
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"

# Git, tags available
	#printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"

# Git, no tags available
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	make
}

package() {
	install -Dm755 \
		"$srcdir/${pkgname%-git}/_build/default/bin/erlang_ls" \
		"$pkgdir/usr/bin/erlang_ls"

}
