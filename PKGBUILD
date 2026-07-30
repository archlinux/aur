# Maintainer: taotieren <admin@taotieren.com>

pkgname=ymake-git
pkgver=0.8.9.30.g233266d
pkgrel=1
pkgdesc="A cross build dsl make tool"
arch=('any')
url="https://github.com/evilbinary/ymake"
license=('MIT')
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
depends=(
	python
	python-colorama
	python-colorlog
	python-networkx
	python-pkg_resources
	# AUR
	python-diskcache
)
makedepends=(
	git
    python-build 
	python-installer 
	python-setuptools
	python-wheel 
)
backup=()
options=()
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"
    git describe --always --tags | sed 's/^v//' | sed 's|-|.|g'
}

prepare()
{
    git -C "${srcdir}/${pkgname}" clean -dfx
}

build() {
    cd "${srcdir}/${pkgname}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}



