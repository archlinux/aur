# Maintainer: katt <magunasu.b97@gmail.com>

pkgname=gallery-dl-git
pkgver=1.22.3.r5.g36ead455
pkgrel=1
pkgdesc='Command-line program to download image-galleries and collections from several image hosting sites (git)'
arch=(any)
url=https://github.com/mikf/gallery-dl
license=(GPL2)
depends=(python python-requests)
makedepends=(python-build python-installer python-setuptools python-wheel git)
optdepends=('ffmpeg: Convert Pixiv Ugoira to WebM'
            'youtube-dl: Download videos'
            'python-pysocks: SOCKS support'
            'python-brotli: for brotli decompression')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(git+"${url}".git)
md5sums=('SKIP')

pkgver() {
    git -C "${pkgname%-git}" describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${pkgname%-git}"
    make
    python -m build --wheel --no-isolation
}

check() {
    make -C "${pkgname%-git}" test
}

package() {
    cd "${pkgname%-git}"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
