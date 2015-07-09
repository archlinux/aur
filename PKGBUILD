# Maintainer: Josip Janzic <josip.janzic@gmail.com>
pkgname=iojs-bin
pkgver=2.3.3
pkgrel=2
pkgdesc="Evented I/O for V8 JavaScript - Node.js fork"
arch=('i686' 'x86_64'  'armv6h' 'armv7h')
url="https://iojs.org/"
license=('MIT')
depends=('openssl')
optdepends=('python2: for node-gyp')
provides=('nodejs' 'npm')
conflicts=('nodejs' 'npm')
options=('!emptydirs')

_arch=x64
[[ $CARCH = i686 ]] && _arch=x86
[[ $CARCH = armv6h ]] && _arch=armv6l
[[ $CARCH = armv7h ]] && _arch=armv7l

source=("https://iojs.org/dist/v${pkgver}/iojs-v${pkgver}-linux-${_arch}.tar.xz")

sha256sums=('f5bc841ad4ddefcd4074a53f41ba9a1999098d4cd561c9ec726b7da19a64ffdc')
[[ $CARCH = i686 ]] && sha256sums[0]='ad12d7c935bfcece50804120ac6c20963cca2a5a443624ce1ccae3719db1d6bb'
[[ $CARCH = armv6h ]] && sha256sums[0]='32ffb2f7055cce3fcc36b52c2baf16fdb7c2bcadcab18837f1235dfddea3f7b6'
[[ $CARCH = armv7h ]] && sha256sums[0]='644ab3df76f5afe83649597ddb51da61043049bbef5619fc6cb37a2e02ca9609'

_extracted_arch=$_arch
[[ $CARCH = i686 ]] && _extracted_arch=ia32

package() {
        cd "iojs-v${pkgver}-linux-${_extracted_arch}"

        mkdir "$pkgdir/usr/"

        rm -rf ./share/systemtap
        mv ./{bin,include,lib,share} "$pkgdir/usr/"

        install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/iojs/LICENSE
}
