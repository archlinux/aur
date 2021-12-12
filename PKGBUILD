# Maintainer: kraftwerk28 <kefirchik3@gmail.com>

pkgname=lua-i3ipc-git
_pkgname="${pkgname%-git}"
pkgver=v1.2.r0.g8f6e411
pkgrel=1
pkgdesc="A lua library for controlling i3wm & Sway"
arch=('any')
url="https://github.com/kraftwerk28/lua-i3ipc.git"
license=('MIT')
depends=('luajit')
makedepends=('git' 'luarocks' 'tree')
source=("git+https://github.com/kraftwerk28/lua-i3ipc.git")
sha256sums=('SKIP')

pkgver() {
	cd $_pkgname
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
	local luaver=5.1
	cd "$srcdir/$_pkgname"
	luarocks \
		--lua-version "$luaver" \
		--tree "$pkgdir/usr" \
		make --no-manifest \
		$srcdir/$_pkgname/*.rockspec

	# local dir="$pkgdir/usr/share/lua/$luaver/"
	# for rock in ${rocks[@]}; do
	# 	luarocks \
	# 		--lua-version $luaver \
	# 		--tree "$pkgdir/usr" \
	# 		make --no-manifest "$rock"
	# done
	# mkdir -p $dir
	# cd $dir
	# cp -R "$srcdir/$_pkgname/i3ipc/" .
}
