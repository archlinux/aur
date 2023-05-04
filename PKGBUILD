# Maintainer: Oystein Sture <oysstu a.t gmail.com>
# Contributor: 

pkgname=python-imageio-ffmpeg
pkgver=0.4.8
pkgrel=2
pkgdesc="FFMPEG wrapper for Python"
arch=("any")
license=("BSD")
url="https://github.com/imageio/imageio-ffmpeg"
depends=('python' 'ffmpeg')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel')
source=("git+https://github.com/imageio/imageio-ffmpeg.git#tag=v${pkgver}"
	"pip_requirement.patch")
sha256sums=('SKIP'
            '16d32a6e263fa30ae43c7d050d5a3d657ab1222fccd4f4d603c797317ccb57ae')

prepare() {
    cd "imageio-ffmpeg"
    patch --forward --strip=1 --input="${srcdir}/pip_requirement.patch"
}

build() {
    cd "imageio-ffmpeg"
    python -m build --wheel --no-isolation
}

package() {
    cd "imageio-ffmpeg"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/python-imageio-ffmpeg/LICENSE"
}
