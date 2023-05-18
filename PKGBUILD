# Maintainer: Martin Rys <rys.pw/contact>
# Previous maintainer: Simon Tas <simon.tas.st@gmail.com>

pkgname="deemix-git"
_pkgname="deemix-py"
pkgver=r675.5f978acec7
pkgrel=1
pkgdesc="a deezer downloader built from the ashes of Deezloader Remix."
arch=('any')
url="https://gitlab.com/RemixDev/$_pkgname"
license=('gpl3')
depends=('python>=3.7' 'python-click' 'python-pycryptodomex' 'python-mutagen' 'python-requests' 'python-spotipy' 'python-eventlet' 'python-deezer-py')
conflicts=('deemix')
makedepends=('git' 'python-setuptools')
provides=('deemix')
source=("${_pkgname}::git+https://gitlab.com/RemixDev/$_pkgname")
md5sums=('SKIP')

pkgver() {
	cd "${_pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=10 HEAD)"
}

build() {
	cd ${srcdir}/${_pkgname}
	python setup.py build
}

package() {
	cd ${srcdir}/${_pkgname}

	python setup.py install --root="${pkgdir}" --optimize=1
}
