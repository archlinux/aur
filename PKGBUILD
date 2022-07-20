# Maintainer: DanielNak <daniel@tee.cat>
# Package author: akiyosi <https://github.com/akiyosi>

_pkgname=goneovim
_author=akiyosi
pkgname=$_pkgname-git-bin
pkgver=0.6.2
pkgrel=1
pkgdesc="A Neovim GUI written in Go"
arch=('any')
url="https://github.com/$_author/$_pkgname"
license=('MIT')
depends=(
	'neovim'
	'qt5-base'
	'qt5-tools'
	'qt5-multimedia'
	'qt5-svg'
	'qt5-declarative'
	'qt5-webchannel'
	'qt5-webengine'
)
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
# source=("git+https://github.com/$_author/$_pkgname/releases/download/v$pkgver/$_pkgname-v$pkgver-archlinux.tar.bz2")
source=("git+https://github.com/$_author/$_pkgname.git")
md5sums=('SKIP')

# If project uses github releases:
pkgver() {
	curl https://api.github.com/repos/$_author/$_pkgname/releases 2>/dev/null | grep -E 'tag_name.+v' | cut -d '"' -f4 | head -n 1 | tr -d v
}

build() {
	cd "$_pkgname"
	curl -LO https://github.com/$_author/$_pkgname/releases/download/v$pkgver/$_pkgname-v$pkgver-archlinux.tar.bz2
	tar -xf $_pkgname-v$pkgver-archlinux.tar.bz2
}

package() {
	cd "$_pkgname"
	install -Dm644 LICENSE* "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
	cd "$_pkgname-v$pkgver-archlinux"
	install -Dm755 $_pkgname "$pkgdir/usr/bin/$_pkgname"
	install -Dm644 runtime/doc/$_pkgname.txt "$pkgdir/usr/share/doc/$_pkgname/$_pkgname.txt"
}
