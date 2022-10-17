# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Christian Hesse <mail@eworm.de>

pkgname=vim-trailing-whitespace-git
_pkg="${pkgname%-git}"
pkgver=1.0.r31.g9071740
pkgrel=1
pkgdesc='Highlights trailing whitespace'
arch=('any')
url='https://github.com/bronson/vim-trailing-whitespace'
license=('CCPL')
depends=('vim-plugin-runtime')
makedepends=('git')
provides=("$_pkg")
conflicts=('vim-better-whitespace' "$_pkg")
source=("$_pkg::git+$url")
sha256sums=('SKIP')

pkgver() {
	git -C "$_pkg" describe --long --tags | sed 's/-/.r/;s/-/./'
}

package() {
	cd "$_pkg"
	find doc plugin \
		-type f \
		-exec install -Dm644 '{}' "$pkgdir/usr/share/vim/vimfiles/{}" \;
}
