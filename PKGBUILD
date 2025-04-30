# Maintainer: Egor Vorontsov <sdoregor@sdore.me>
# Contributor: Gleb Liutsko <gleb290303@gmail.com>

_pkgbase=python-yandex-music-api
_gitname=yandex-music-api
pkgname=${_pkgbase}-git
pkgver=r666.15fc42b
pkgrel=1
pkgdesc="Unofficial Python library for the Yandex.Music API (git version)"
arch=('any')
url="https://github.com/MarshalX/${_gitname}"
license=('LGPL3')
depends=('python-aiofiles' 'python-aiohttp' 'python-requests')
makedepends=('python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest')
provides=("${_pkgbase}")
conflicts=("${_pkgbase}")
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_gitname}"

	printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${srcdir}/${_gitname}"

	python -m build --wheel --no-isolation
}

check() {
	cd "${srcdir}/${_gitname}"

	pytest './tests'
}

package() {
	cd "${srcdir}/${_gitname}"

	python -m installer --destdir="${pkgdir}" './dist'/*.whl

	rm -rf "${pkgdir}/usr/lib"/python*/'site-packages/tests'
}
