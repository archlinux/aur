# Maintainer: Xavion <Xavion (dot) 0 (at) Gmail (dot) com>

_base1_=boto
_base2_=rsync
_appname_=${_base1_}-${_base2_}
_filename_=${_base1_}_${_base2_}
pkgname=python2-${_appname_}
pkgver=0.8.1
pkgrel=1
pkgdesc="An rsync-like utility using boto's S3 and Google Storage interfaces."
url="http://github.com/seedifferently/boto_rsync"
license="MIT"
arch=("any")
makedepends=("git")
depends=("python2" "python2-boto")
source=()

_gitroot="http://github.com/seedifferently/${_filename_}.git"
_gitname="${_filename_}"

build() {
	cd "${srcdir}"

	# Repository
	msg "Connecting to GIT server ..."
	if [ -d "${srcdir}/${_gitname}" ] ; then
		cd ${_gitname} && git pull origin
	else
		git clone "${_gitroot}"
		cd ${_gitname}
	fi

	# Changes
	sed -i 's|#!/usr/bin/env python|#!/usr/bin/env python2|g' bin/${_appname_}
}

package() {
	cd ${_gitname}

	# Install
	python2 setup.py install -O1 --root="${pkgdir}"

	# License
	install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
