# Maintainer: Josip Janzic <josip.janzic@gmail.com>
pkgname=iojs-bin
pkgver=3.0.0
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

sha256sums=('a625308ba6148b9aefabbd524773dd1028c19e6a85d9ea6bc60fc426b7f8b7e8')
[[ $CARCH = i686 ]] && sha256sums[0]='9f3314761b3b534db3dbbc52f555b44c0e16be14ed572fb8eb5769a38aadae1d'
[[ $CARCH = armv6h ]] && sha256sums[0]='e5c2dea20d8bd07032a43e9d170992a511585e0ed90d329d68778b253f8c6a10'
[[ $CARCH = armv7h ]] && sha256sums[0]='e26b7334da98e7da9b35e08a322a0fc6ff63df63bc296666e2c149ede5f7b769'

_extracted_arch=$_arch
[[ $CARCH = i686 ]] && _extracted_arch=ia32

package() {
        cd "iojs-v${pkgver}-linux-${_extracted_arch}"

        mkdir "$pkgdir/usr/"

        rm -rf ./share/systemtap
        mv ./{bin,include,lib,share} "$pkgdir/usr/"

        install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/iojs/LICENSE
}
