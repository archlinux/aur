# Maintainer: Josip Janzic <josip.janzic@gmail.com>
pkgname=iojs-bin
pkgver=2.3.4
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

sha256sums=('4b577741f404cce07ade6ac2c5a9f82daa2c97a857bdb88f92e9d4601853f424')
[[ $CARCH = i686 ]] && sha256sums[0]='c00de35f2f49652ea76666718b4f04cdbefafb8adaabd0385b9d167f8aef81c1'
[[ $CARCH = armv6h ]] && sha256sums[0]=''
[[ $CARCH = armv7h ]] && sha256sums[0]='fdff5933e4ea0a319e16ffd98fece44f72c36d156ab342610ca48f180c832fab'

_extracted_arch=$_arch
[[ $CARCH = i686 ]] && _extracted_arch=ia32

package() {
        cd "iojs-v${pkgver}-linux-${_extracted_arch}"

        mkdir "$pkgdir/usr/"

        rm -rf ./share/systemtap
        mv ./{bin,include,lib,share} "$pkgdir/usr/"

        install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/iojs/LICENSE
}
