# Maintainer: Joshua Smith <smolsheep@opensuse.org>

pkgname=rpm-spec-language-server-git
_pkgname=${pkgname%-git}
pkgver=0.0.1.r238.g4af97ed
pkgrel=1
pkgdesc='Language Server for RPM spec files'
url='https://github.com/dcermak/rpm-spec-language-server'
arch=('any')
license=('GPL-2.0-or-later')
makedepends=(
	python-build
	python-wheel
	python-installer
)
depends=(
	python-specfile
	python-pygls
)
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+$url.git")
b2sums=('SKIP')

pkgver() {
    cd $_pkgname
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build(){
    cd $_pkgname
	python -m build --wheel --no-isolation
}
package(){
    cd $_pkgname
	python -m installer --destdir="$pkgdir" dist/*.whl
}
