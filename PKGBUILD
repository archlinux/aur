# Maintainer: katt <magunasu.b97@gmail.com>

pkgname=gallery-dl-git
pkgver=1.17.0.r9.g780bac4c
pkgrel=1
pkgdesc='Command-line program to download image-galleries and collections from several image hosting sites (git)'
arch=(any)
url=https://github.com/mikf/gallery-dl
license=(GPL2)
depends=(python python-requests)
makedepends=(python-setuptools git)
optdepends=('ffmpeg: Convert Pixiv Ugoira to WebM'
            'youtube-dl: Download videos')
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

package() {
    cd "${pkgname%-git}"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
