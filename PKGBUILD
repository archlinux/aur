# Maintainer: Brendan Abolivier <brendan@archlinux.info>

pkgname=nodejs-lts-bin
pkgver=4.3.1
pkgrel=1
pkgdesc='Evented I/O for V8 javascript'
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url='http://nodejs.org/'
license=('MIT')
depends=('openssl' 'zlib' 'icu' 'libuv' 'http-parser')
provides=('nodejs' 'npm')
optdepends=('npm: nodejs package manager')
conflicts=('nodejs' 'npm')

build() {
    # Matching the arch format with Node's
    case $CARCH in
        "i686")     suffix="x86"
                    ;;
        "x86_64")   suffix="x64"
                    ;;
        "armv6h")   suffix="armv6l"
                    ;;
        "armv7h")   suffix="armv7l"
                    ;;
        "aarch64")  suffix="arm64"
                    ;;
        *)          echo "No supported architecture found"
                    exit 1
                    ;;
    esac

    # Downloading the right archive
    curl https://nodejs.org/dist/v$pkgver/node-v$pkgver-linux-$suffix.tar.gz > node.tar.gz

    tar -xf node.tar.gz
}

package() {
    cd node-v$pkgver-linux-*
    install -d $pkgdir/usr
    cp -R bin/ include/ lib/ share/ $pkgdir/usr/
}

