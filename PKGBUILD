# Maintainer: katt <magunasu.b97@gmail.com>

pkgname=gallery-dl-git
pkgver=1.17.1.r11.g5ad615f0
pkgrel=1
pkgdesc='Command-line program to download image-galleries and collections from several image hosting sites (git)'
arch=(any)
url=https://github.com/mikf/gallery-dl
license=(GPL2)
depends=(python python-requests)
makedepends=(python-setuptools git)
checkdepends=(python-nose)
optdepends=('ffmpeg: Convert Pixiv Ugoira to WebM'
            'youtube-dl: Download videos'
            'python-pysocks: SOCKS support')
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
    python setup.py build
}

check() {
    make -C "${pkgname%-git}" test
}

package() {
    cd "${pkgname%-git}"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
