# Maintainer: katt <magunasu.b97@gmail.com>

pkgname=gallery-dl-git
pkgver=1.25.2.r12.ge07ceb9
pkgrel=1
pkgdesc='Command-line program to download image-galleries and collections from several image hosting sites (git)'
arch=(any)
url=https://github.com/mikf/gallery-dl
license=(GPL2)
depends=(python python-requests)
makedepends=(python-build python-installer python-setuptools python-wheel git)
optdepends=('ffmpeg: Pixiv Ugoira conversion'
            'yt-dlp: Video downloads'
            'youtube-dl: Video downloads'
            'python-pysocks: SOCKS proxy support'
            'python-brotli: Brotli compression support'
            'python-brotlicffi: Brotli compression support'
            'python-yaml: YAML configuration file support'
            'python-toml: TOML configuration file support for Python<3.11'
            'python-secretstorage: GNOME keyring passwords for --cookies-from-browser')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(git+"${url}".git)
md5sums=('SKIP')

pkgver() {
    git -C "${pkgname%-git}" describe --long --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
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
