# Maintainer: Umar Alfarouk <medrivia@gmail.com>

_pkgname=nvavif-py
pkgname=python-nvavif-py
pkgver=0.1.0
pkgrel=1
pkgdesc="Hardware-accelerated AVIF encoding/decoding for Python, powered by NVIDIA NVENC"
arch=('x86_64' 'aarch64')
url="https://github.com/imbecility/nvavif-py"
license=('MIT')
depends=(
	'python'
	'python-numpy'
	'python-pillow'
	'ffmpeg'
)
makedepends=(
	'cargo'
	'nasm'
	'pkgconf'
	'python-build'
	'python-installer'
	'python-maturin'
	'python-wheel'
)
provides=("${pkgname}")
conflicts=("${pkgname}")
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/imbecility/${_pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('3cb7348958dedb724a2ab9260af7f580b573d35f75a50c6752bae31c5fe24148')

build() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	python -m build --wheel --no-isolation
}

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
