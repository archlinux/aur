# Maintainer: CYBERDEViLNL <cyberdevilnl@protonmail.com>
pkgname=lui-git
pkgver=0.1
pkgrel=1
pkgdesc="Lightweight User Interface for Panda3D "
arch=('i686' 'x86_64')
url="https://github.com/tobspr/LUI"
license=('MIT')
depends=()
makedepends=('python' 'cmake' 'freetype2' 'panda3d')

source=("git+https://github.com/tobspr/LUI.git#branch=master")

sha256sums=(
	'SKIP'
)

build() {
	cd "${srcdir}"/"LUI"
	python update_module_builder.py
	python build.py
}

package() {
	cd "${srcdir}"/"LUI"
	local python_version=$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')
	mkdir -p "${pkgdir}"/usr/lib/python${python_version}/site-packages/panda3d/
	install -D -m755 lui.so "${pkgdir}"/usr/lib/python${python_version}/site-packages/panda3d/
}
