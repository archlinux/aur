# Maintainer: Yufan You <ouuansteve at gmail>

pkgname=yutto
pkgver=2.0.0b14
pkgrel=1
pkgdesc='一个可爱且任性的 B 站视频下载器'
arch=('any')
url='https://github.com/SigureMo/yutto'
license=('GPL3')
depends=(
    'python-aiohttp'
    'python-aiofiles'
    'python-biliass'
    'python-dicttoxml'
    'ffmpeg'
)
makedepends=('python-setuptools' 'python-wheel')
optdepends=('python-uvloop: fast asyncio event loop')
source=("https://pypi.io/packages/source/${pkgname:0:1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('81d7ed31f33f4a9d1dd4591fe2b879de0f569b8816961858a011d5a2d66e5359')

build() {
    cd "$pkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
    rm -rf "$pkgdir/usr/lib/"*"/site-packages/tests" || true
}
