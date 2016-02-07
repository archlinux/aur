# Maintainer: Patrick Griffis <tingping@tingping.se>

pkgname=tracer
pkgver=0.6.7
pkgrel=2
pkgdesc='Finds outdated running applications in your system'
_dirname="tracer-tracer-$pkgver-1"
arch=('any')
url='http://tracer-package.com/'
license=('GPL2')
depends=('python-beautifulsoup4' 'python-lxml' 'python-psutil')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/FrostyX/tracer/archive/tracer-$pkgver-1.tar.gz"
        'https://github.com/TingPing/tracer/commit/00563ac7db941e7d5110796a167ef9e63d795997.patch'
        'https://github.com/TingPing/tracer/commit/fe166204a9a20d223efccd5d0508dae81a3bbff4.patch'
        'https://github.com/TingPing/tracer/commit/15a88061fb246f5b2462a05f7abc03d9a38d9212.patch')
sha256sums=('af512290d20acb8bf5195a4310b2f5384a9b97580c6462fbca105f703c9124e5'
            '4fb8c1c064db11998750b6af7b9ba915a077baa34ec1a3f3ffacd01a137fe48c'
            '9c65a17935700bcaa2baac8e0e9e80f3263a2c18f94dc615cd0a2e5f3d88109c'
            '46a0fd79eb26d044fac64cbedbae6a284af9d979d5b76154631b9c0e18e7bf69')

prepare() {
    cd "$_dirname"

    # Add support for arch
    patch -Np1 < "$srcdir/00563ac7db941e7d5110796a167ef9e63d795997.patch"

    # Fix systemctl message
    patch -Np1 < "$srcdir/fe166204a9a20d223efccd5d0508dae81a3bbff4.patch"

    # Fix module not being installed
    patch -Np1 < "$srcdir/15a88061fb246f5b2462a05f7abc03d9a38d9212.patch"
}

build() {
    cd "$_dirname"

    python setup.py build
}

package() {
    cd "$_dirname"

    python setup.py install -O1 --skip-build --root="$pkgdir"
}

