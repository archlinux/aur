# Maintainer: Egor Vorontsov <sdoregor@sdore.me>

_pkgbase=python-sutils
_gitname=utils
pkgname=${_pkgbase}-git
pkgver=r91.7f2eaa7
pkgrel=1
pkgdesc="Sdore's Utils lib"
arch=('any')
url="https://apps.sdore.me/${_gitname}"
license=('LGPL3')
depends=('python-regex' 'python-pygments' 'python-typing_inspect')
makedepends=('python-build' 'python-installer')
provides=("${_pkgbase}")
conflicts=("${_pkgbase}")
source=("git+${url}.git"
        'pyproject.toml')
sha256sums=('SKIP'
            'a55dd9d9b45773520c17d02f305babeff8a54c17bfe01e3b02d17f7dbe5a13dc')

pkgver() {
	cd "${srcdir}/${_gitname}"

	printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${srcdir}"

	python -m build --wheel --no-isolation
}

package() {
	cd "${srcdir}"

	python -m installer --destdir="${pkgdir}" "dist/${_gitname}-"*.whl

	cd "${_gitname}"

	install -Dm755 'utils' -t "${pkgdir}/usr/bin/"
}
