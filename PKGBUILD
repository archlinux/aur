# Maintainer: Harms <thotro at lyse dot net>
_gituser="sarcasm"
_gitrepo="company-irony"

pkgname=emacs-company-irony-git
pkgver=1.1.0.r0.g52aca45
pkgrel=1
pkgdesc="Provides a company-mode asynchronous completion backend for the C, C++ and Objective-C languages."
url="https://github.com/${_gituser}/${_gitrepo}"
arch=('any')
license=('GPL3')
provides=('emacs-company-irony')
depends=('emacs-company-mode' 'irony-mode')
makedepends=('git')
source=("git+https://github.com/${_gituser}/${_gitrepo}.git")
sha256sums=('SKIP')

pkgver()
{
	cd "${_gitrepo}"
	git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
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
