# Maintainer: Lukas Burgey <lukas.burgey@kit.edu>
pkgname=oidc-agent-git
basepkgname=${pkgname%-git}
pkgver=v4.2.2.r1.d4b4c44
pkgrel=1
pkgdesc='A set of tools to manage OpenID Connect tokens and make them easily usable from the command line'
arch=('x86_64')
url='https://github.com/indigo-dc/oidc-agent'
license=('MIT')
groups=()
depends=(
	'curl'
	'libmicrohttpd'
	'libseccomp'
	'libsecret'
	'libsodium'
	'qrencode'
)
makedepends=(
	'git'
	'help2man'
)
provides=($basepkgname)
conflicts=($basepkgname)
replaces=()
backup=()
options=()
install=
source=("git+$url#branch=master") # this clones to $srcdir/$basepkgname
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$basepkgname"
	git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/$basepkgname"
	make
}

package() {
	cd "$srcdir/$basepkgname"
	make install_lib PREFIX="$pkgdir" LIB_PATH="$pkgdir/usr/lib" BIN_AFTER_INST_PATH="/usr"
	make install PREFIX="$pkgdir" LIB_PATH="$pkgdir/usr/lib" BIN_AFTER_INST_PATH="/usr"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
