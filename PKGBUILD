pkgbase='python-basicsr'
pkgname=('python-basicsr' 'python-basicsr-cuda')
pkgver=1.3.5
pkgrel=1
pkgdesc="Open Source Image and Video Restoration Toolbox for Super-resolution, Denoise, Deblurring, etc. "
arch=('x86_64')
url="https://github.com/xinntao/BasicSR"
license=('Apache 2.0')
depends=('python-addict' 'python-future' 'python-lmdb' 'python-numpy' 'python-opencv' 'python-pillow'
'python-pyaml' 'python-requests' 'python-scikit-image' 'python-scipy' 'tensorboard'
'python-pytorch' 'python-torchvision' 'python-tqdm' 'yapf')
makedepends=('python-setuptools')

source=("https://github.com/xinntao/BasicSR/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('cc3d53d6750a301b9098a21a91e91739cd177ff05b5710a8799af047324a951b')

prepare() {
    cp -a BasicSR-$pkgver{,-cuda}
}

package_python-basicsr() {
    cd BasicSR-${pkgver}
    python setup.py install --root="${pkgdir}" --optimize=1
}

package_python-basicsr-cuda() {
    depends+=('cuda' 'cudnn')
    provides=("python-basicsr=$pkgver")
    conflicts=('python-basicsr')
    cd BasicSR-${pkgver}-cuda
    BASICSR_EXT=True python setup.py install --root="${pkgdir}" --optimize=1
}
