# Maintainer: Egor Vorontsov <sdoregor@sdore.me>

_pkgbase=python-scurses
_gitname=Scurses
pkgname=${_pkgbase}-git
pkgver=v2.r4.ged0c6ea
pkgrel=2
pkgdesc="Python curses-based TUI framework"
arch=('any')
url="https://apps.sdore.me/${_gitname}"
license=('LGPL3')
depends=('python-sutils')
provides=("${_pkgbase}")
conflicts=("${_pkgbase}")
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_gitname}"

	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "${srcdir}"

	touch 'pyproject.toml'

	python -m build --wheel --no-isolation
}

package() {
	cd "${srcdir}"

	python -m installer --destdir="${pkgdir}" "dist/${_gitname}-"*.whl
}
