# Maintainer: Egor Vorontsov <sdoregor@sdore.me>

_pkgbase=python-scimg
_gitname=cimg
pkgname=${_pkgbase}-git
pkgver=r12.558a5db
pkgrel=2
pkgdesc="Python console image view library"
arch=('any')
url="https://apps.sdore.me/${_gitname}"
license=('LGPL3')
depends=('python-pillow' 'python-sutils')
optdepends=('python-requests: for fetching images by URLs')
provides=("${_pkgbase}")
conflicts=("${_pkgbase}")
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_gitname}"

	printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${srcdir}"

	touch 'pyproject.toml'

	python -m build --wheel --no-isolation
}

package() {
	cd "${srcdir}"

	python -m installer --destdir="${pkgdir}" "dist/${_gitname}-"*.whl

	cd "${_gitname}"

	install -Dm755 'cimg' 'fbcat' -t "${pkgdir}/usr/bin/"
}
