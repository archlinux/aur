# Maintainer: Josip Janzic <josip.janzic@gmail.com>
pkgname=iojs-bin
pkgver=3.2.0
pkgrel=1
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

sha256sums=('b81755e73929edc1b00871bee4062ca39346186bc6608a287c4cd9a2a09225a4')
[[ $CARCH = i686 ]] && sha256sums[0]='374f4882535bb826c85120b0adf23e92a268b77c15ae8e49582951750da81537'
[[ $CARCH = armv6h ]] && sha256sums[0]='42ec5f6bb30c7de39565c9340aa9d89858e8ff3b23c1646f86075d39f1ffa32a'
[[ $CARCH = armv7h ]] && sha256sums[0]='7258fef5bb5de1777b416d3c2e9706d0f058e646d170bc8bfffe3e1e16180b85'

_extracted_arch=$_arch
[[ $CARCH = i686 ]] && _extracted_arch=ia32

package() {
        cd "iojs-v${pkgver}-linux-${_extracted_arch}"

        mkdir "$pkgdir/usr/"

        rm -rf ./share/systemtap
        mv ./{bin,include,lib,share} "$pkgdir/usr/"

        install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/iojs/LICENSE
}
