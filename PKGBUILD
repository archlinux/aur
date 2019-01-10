# Maintainer: Harms <thotro at lyse dot net>
_gituser="brianjcj"
_gitrepo="auto-complete-clang"

pkgname=emacs-auto-complete-clang-git
pkgver=r16.a195db1
pkgrel=2
pkgdesc="The AC sources for Clang. Combine the power of AC, Clang and Yasnippet."
url="https://github.com/${_gituser}/${_gitrepo}"
arch=('any')
license=('GPL3')
provides=('emacs-auto-complete-clang')
depends=('emacs' 'emacs-auto-complete')
makedepends=('git')
source=("git+https://github.com/${_gituser}/${_gitrepo}.git")
sha256sums=('SKIP')

pkgver()
{
	cd "${_gitrepo}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build()
{
	cd "${_gitrepo}"
	emacs -q --no-splash -batch -L . -f batch-byte-compile *.el
}

package()
{
	cd "${_gitrepo}"
	install -d "${pkgdir}"/usr/share/emacs/site-lisp/"${_gitrepo}"/
	install -m644 *.el{c,} "${pkgdir}"/usr/share/emacs/site-lisp/${_gitrepo}/
}
