# Maintainer: Martin Rys <https://rys.rs/contact>
# Contributor: Simon Tas <simon.tas.st@gmail.com>

pkgname="deemix-git"
_pkgname="deemix-py"
pkgver=r675.5f978acec7
pkgrel=2
pkgdesc="a deezer downloader built from the ashes of Deezloader Remix"
arch=('any')
url="https://gitlab.com/RemixDev/${_pkgname}"
license=('GPL-3.0-or-later')
depends=('python' 'python-click' 'python-pycryptodomex' 'python-mutagen' 'python-requests' 'python-spotipy' 'python-eventlet' 'python-deezer-py')
conflicts=('deemix')
makedepends=('git' 'python-setuptools' 'python-build' 'python-installer')
provides=('deemix')
source=("${_pkgname}::git+https://gitlab.com/RemixDev/${_pkgname}")
sha256sums=('SKIP')

pkgver() {
	cd "${_pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=10 HEAD)"
}

build() {
	cd "${srcdir}/${_pkgname}"
	python -m build
}

package() {
	cd "${srcdir}/${_pkgname}"

	python -m installer --destdir="${pkgdir}" dist/*.whl
}
