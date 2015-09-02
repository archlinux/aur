# Maintainer: Josip Janzic <josip.janzic@gmail.com>
pkgname=iojs-bin
pkgver=3.3.0
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

sha256sums=('add2cd394886d7d3a92bc84e9af6e4a0d509060f0b63bf4b11de6471046043e8')
[[ $CARCH = i686 ]] && sha256sums[0]='a4ef6de573441b50bffe8a82f66ebf941a238f175d9decc3d021a615110722d4'
[[ $CARCH = armv6h ]] && sha256sums[0]='6c210d78728c51a69ab6fdbf096c69d3632897bcc4eed4c60958e34b642ed53f'
[[ $CARCH = armv7h ]] && sha256sums[0]='688b4506efaf2fb330c6b3d6dbe80f47af60df2cdaf24f47f0ed966d01815819'

_extracted_arch=$_arch
[[ $CARCH = i686 ]] && _extracted_arch=ia32

package() {
        cd "iojs-v${pkgver}-linux-${_extracted_arch}"

        mkdir "$pkgdir/usr/"

        rm -rf ./share/systemtap
        mv ./{bin,include,lib,share} "$pkgdir/usr/"

        install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/iojs/LICENSE
}
