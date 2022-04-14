# Maintainer: Oystein Sture <oysstu a.t gmail.com>
# Contributor: 

pkgname=python-imageio-ffmpeg
pkgver=0.4.6
pkgrel=1
pkgdesc="FFMPEG wrapper for Python"
arch=("any")
license=("BSD")
url="https://github.com/imageio/imageio-ffmpeg"
depends=('python' 'ffmpeg')
makedepends=('python-setuptools')
source=("https://github.com/imageio/imageio-ffmpeg/archive/v${pkgver}.tar.gz"
	"pip_requirement.patch")
sha256sums=('570d742a3195ca3e6cd371700cf7c2d7e26aa9f7c11d7eab4cc8a9db4516513f'
            '16d32a6e263fa30ae43c7d050d5a3d657ab1222fccd4f4d603c797317ccb57ae')

prepare() {
    cd "imageio-ffmpeg-${pkgver}"
    patch --forward --strip=1 --input="${srcdir}/pip_requirement.patch"
}

build() {
    cd "imageio-ffmpeg-${pkgver}"
    python setup.py build
}

package() {
    cd "imageio-ffmpeg-${pkgver}"
    python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/python-imageio-ffmpeg/LICENSE"
}
