
pkgname=python-art-git
pkgver=r2176.3917a898faeb7490d3043a1158b13a5d9b51e273
pkgrel=1
pkgdesc="ASCII art library for Python"
arch=('any')
url='https://github.com/sepandhaghighi/art/'
license=('MIT')
depends=('python')
makedepends=(
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel'
)
source=("git+$url")
b2sums=('SKIP')

pkgver() {
	cd 'art'
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse HEAD)"
}

build() {
    cd 'art'
    python -m build --wheel --no-isolation
}

package() {
    cd 'art'
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
