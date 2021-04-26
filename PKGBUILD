# Maintainer: katt <magunasu.b97@gmail.com>
# Contributor: LLL2yu <lll2yu@protonmail.com>

pkgname=gallery-dl
pkgver=1.17.3
pkgrel=1
pkgdesc='Command-line program to download image-galleries and collections from several image hosting sites'
arch=(any)
url=https://github.com/mikf/gallery-dl
license=(GPL2)
depends=(python python-requests)
makedepends=(python-setuptools git)
checkdepends=(python-nose)
optdepends=('ffmpeg: Convert Pixiv Ugoira to WebM'
            'youtube-dl: Download videos'
            'python-pysocks: SOCKS support')
source=(git+"${url}".git#tag=v"${pkgver}"?signed)
validpgpkeys=(3E09F5908333DD83DBDCE7375680CA389D365A88) #Mike Fährmann
sha512sums=('SKIP')

build() {
    cd ${pkgname}
    make
    python setup.py build
}

check() {
    make -C ${pkgname} test
}

package() {
    cd ${pkgname}
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
