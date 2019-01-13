# Maintainer: Harms <thotro at lyse dot net>
_gituser="sarcasm"
_gitrepo="flycheck-irony"

pkgname=emacs-flycheck-irony-git
pkgver=r10.42dbecd
pkgrel=1
pkgdesc="provides a flycheck checker for the C, C++ and Objective-C languages."
url="https://github.com/${_gituser}/${_gitrepo}"
arch=('any')
license=('GPL3')
provides=('emacs-flycheck-irony')
depends=('emacs-flycheck' 'irony-mode')
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
