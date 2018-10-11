# Maintainer: xpt <user.xpt@gmail.com>
pkgname=python2-pypar-git
pkgver=20181011
pkgrel=1
pkgdesc="A Python library that provides parallelism using the message passing interface to handle big data and highly computational problems"
depends=('python2')
makedepends=('git' 'python2-numpy')
url="https://github.com/daleroberts/pypar"
license=('GPL3')
arch=('any')
source=()

_gitroot="https://github.com/daleroberts/pypar"
_gitname="pypar"
_gitbranch="master"


build()
{
	cd "${srcdir}"

	msg "Connecting to GitHub..."

	if [ -d "${srcdir}/${_gitname}" ]; then
		cd "${_gitname}"
		git pull origin "${_gitbranch}"
		msg "The local files are updated."
	else
		git clone "${_gitroot}"
		cd "${_gitname}"
		git checkout "${_gitbranch}"
	fi

	msg "Git checkout done or server timeout."
}

package()
{
	cd "${srcdir}/${_gitname}"
	python2 setup.py install --root="${pkgdir}" --prefix=/usr --optimize=1 || return 1
} 
