# Maintainer: Tomasz Bursztyka <tomasz dot bursztyka at proton dot me>

pkgname=python-scikit-fmm
pkgver=2024.05.29
pkgrel=1
pkgdesc="The fast marching method for Python"
arch=("any")
url="https://github.com/scikit-fmm/scikit-fmm"
license=("BSD-3-Clause")
depends=("python-numpy"
	 "python-scipy")
makedepends=("gcc"
	     "meson-python"
	     "python-build"
	     "python-numpy1>=1.0.2"
	     "python-wheel")
source=("https://github.com/scikit-fmm/scikit-fmm/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=("9f6973d1bd1b90dcdef4f94339e52402dc1a3d843e46f6505444f1368982ebe2")

build() {
	cd "scikit-fmm-${pkgver}"
	python -m build --wheel --no-isolation --skip-dependency-check
}

package() {
    cd "scikit-fmm-${pkgver}"

    install -Dm644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
