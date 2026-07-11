# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=Cyxuan0311
_pkgname=Plmux
_appname=plmux

pkgname=${_pkgname,,}
pkgver=0.1.0
pkgrel=1
pkgdesc="A lightweight, cross-platform terminal multiplexer inspired by tmux, built with Python, Rich, and C extensions"

license=('MIT')
arch=('x86_64' 'aarch64')

url="https://github.com/${_pkgauthor}/${pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"

depends=('glibc' 'gcc-libs' 'python' 'python-psutil' 'python-pytest' 'python-ptyprocess' 'python-jinxed' 'python-uvloop' 'python-pyperclip' 'python-rich' 'python-blessed')
makedepends=('python-setuptools' 'python-wheel' 'python-build' 'python-installer')
provides=("${_appname}")

source=("${pkgname}-${pkgver}.tgz::https://github.com/${_pkgauthor}/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('aa48473195402a99f7696a100eaf609cbdd1011be7e26bd6ac203860e4931840')

build() {
	cd "${srcdir}/${_pkgname}-${pkgver}/" || exit 1

	python -m build --wheel --no-isolation
}

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}/" || exit 1

	python -m installer --destdir="${pkgdir}" dist/*.whl

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "License" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
