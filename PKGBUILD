# Maintainer: Harms <thotro at lyse dot net>
_gituser="hotpxl"
_gitrepo="company-irony-c-headers"

pkgname=emacs-company-irony-c-headers-git
pkgver=1.0.0.r2.g72c386a
pkgrel=1
pkgdesc="Company-mode backend for C/C++ header files that works with irony-mode."
url="https://github.com/${_gituser}/${_gitrepo}"
arch=('any')
license=('GPL3')
provides=('emacs-company-irony-c-headers')
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
