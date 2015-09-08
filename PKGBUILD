# Maintainer: Josip Janzic <josip.janzic@gmail.com>
pkgname=iojs-bin
pkgver=4.0.0
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

sha256sums=('cc4eae3e4c2dd8b068d69e6d1d9849a863c51e3ec3d7f85cfb1e91e63912b66a')
[[ $CARCH = i686 ]] && sha256sums[0]='6fe4ab43eae74c1cb376169f4f161bddef04ff8a693a772875de651fafa4252b'
[[ $CARCH = armv6h ]] && sha256sums[0]=''
[[ $CARCH = armv7h ]] && sha256sums[0]='1ed96526e87c29b4d3b5618b5d2e3e65e1aef6a5e40f90ec3a3afd21047517cf'

_extracted_arch=$_arch
[[ $CARCH = i686 ]] && _extracted_arch=ia32

package() {
        cd "iojs-v${pkgver}-linux-${_extracted_arch}"

        mkdir "$pkgdir/usr/"

        rm -rf ./share/systemtap
        mv ./{bin,include,lib,share} "$pkgdir/usr/"

        install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/iojs/LICENSE
}
