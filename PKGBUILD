# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: olddog <jeff@impcode.com>

pkgname=vim-gutentags-git
_pkg="${pkgname%-git}"
pkgver=1.0.0.r77.g1337b18
pkgrel=3
pkgdesc='A Vim plugin that manages your tag files'
arch=('any')
url='https://github.com/ludovicchabant/vim-gutentags'
license=('MIT')
groups=('vim-plugins')
depends=('vim-plugin-runtime' 'ctags')
makedepends=('git')
provides=("$_pkg")
conflicts=("$_pkg")
source=("$_pkg::git+$url")
md5sums=('SKIP')

pkgver() {
	git -C "$_pkg" describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

package() {
	local dirs=(autoload doc plat/unix plugin res)
	cd "$_pkg"
	find "${dirs[@]}" -type f -exec install -Dvm644 '{}' "$pkgdir/usr/share/vim/vimfiles/{}" \;
	chmod 755 "$pkgdir/usr/share/vim/vimfiles/plat/unix/"*.sh
	install -Dvm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
