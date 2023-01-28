# Maintainer: katt <magunasu.b97@gmail.com>
# Contributor: LLL2yu <lll2yu@protonmail.com>

pkgname=gallery-dl
pkgver=1.24.5
pkgrel=1
pkgdesc='Command-line program to download image-galleries and collections from several image hosting sites'
arch=(any)
url=https://github.com/mikf/gallery-dl
license=(GPL2)
depends=(python python-requests)
makedepends=(python-build python-installer python-setuptools python-wheel git)
optdepends=('ffmpeg: Convert Pixiv Ugoira to WebM'
            'youtube-dl: Download videos'
            'python-pysocks: SOCKS support'
            'python-brotli: for brotli decompression')
_tag=2a9779aeaa5cb9adb2b07f649d151ac5c82b88c3 # git rev-parse v${pkgver}
source=(git+"${url}".git#tag="${_tag}"?signed)
validpgpkeys=(3E09F5908333DD83DBDCE7375680CA389D365A88) #Mike Fährmann
sha512sums=('SKIP')

pkgver() {
    git -C ${pkgname} describe --tags | sed 's/^v//'
}

build() {
    cd ${pkgname}
    make
    python -m build --wheel --no-isolation
}

check() {
    make -C ${pkgname} test
}

package() {
    cd ${pkgname}
    python -m installer --destdir="$pkgdir" dist/*.whl
}
