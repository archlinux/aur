# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Thomas Jost <schnouki@schnouki.net>

pkgname=('git-wip-git' 'vim-git-wip-git' 'emacs-git-wip-git')
_pkg="${pkgname%-git}"
pkgver=0.1.r2.g1c095e9
pkgrel=1
pkgdesc='Script for tracking work-in-progress git branches'
arch=('any')
url="https://github.com/bartman/git-wip"
license=('GPL')
makedepends=('git')
provides=("$_pkg")
conflicts=("$_pkg")
source=("$_pkg::git+$url")
sha256sums=('SKIP')

# FIXME: where should the Sublime Text plugin be installed?

pkgver() {
	git -C "$_pkg" describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

package_git-wip-git() {
	depends=('git' 'bash')
	cd "$_pkg"
	install -D "$_pkg" -t "$pkgdir/usr/bin/"
}

package_emacs-git-wip-git() {
	depends=('emacs' 'git-wip')
	provides=("${pkgname%-git}")
	conflicts=("${pkgname%-git}")
	cd "$_pkg"
	install -Dm644 emacs/*.el -t "$pkgdir/usr/share/emacs/site-lisp/"
}

package_vim-git-wip-git() {
	depends=('vim-plugin-runtime' 'git-wip')
	provides=("${pkgname%-git}")
	conflicts=("${pkgname%-git}")
	cd "$_pkg"
	install -Dm644 vim/plugin/git-wip.vim -t "$pkgdir/usr/share/vim/vimfiles/plugin/"
}
