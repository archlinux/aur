# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=GIN-SYSTEMS
_gitname=vigil-tui
_appname=${_gitname%-tui}
pkgname=${_gitname}
pkgdesc="Real-time terminal power monitor — CPU · GPU · RAM · Network · Processes"

pkgver=1.0.0
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
conflicts=("${_appname}")
depends=('python' 'python-textual' 'python-psutil' 'python-rich' 'python-nvidia-ml-py')

options=(!strip)

source=("${_appname}-${pkgver}.tgz::${_ghurl}/archive/${_gitversion}.tar.gz")
sha256sums=('cb989414ca4784264e083f5e2b89b8ab7c707dff6ea76b7cd5d69301fcd898bd')


build() {
    cd "${srcdir}/${pkgname}-${pkgver}/" || exit

    python -m build --wheel --no-isolation
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}/" || exit

	python -m installer --destdir="${pkgdir}" dist/*.whl

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
