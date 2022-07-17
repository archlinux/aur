# Maintainer: Murli Tawari <kraanzu@gmail.com>
pkgname=termtyper-git
_gitname=termtyper
pkgver=2.0.0
pkgrel=1
pkgdesc="A TUI application written in python for typing!"
arch=('any')
url="https://github.com/kraanzu/termtyper"
license=('MIT')
depends=(python-rich python-textual python-playsound)
makedepends=(python-build python-installer python-wheel python-poetry git)
provides=(termtyper)
conflicts=(termtyper)
source=("git+https://github.com/kraanzu/termtyper")
md5sums=('SKIP')

pkgver() {
	cd "${_gitname}"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "${_gitname}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_gitname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/termtyper/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/termtyper/README.md"
}
