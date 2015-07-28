# Maintainer: Josip Janzic <josip.janzic@gmail.com>
pkgname=iojs-bin
pkgver=2.5.0
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

sha256sums=('52b91937382383fa82a8c4e1d26679a52255d0e16b9aa3f521bc6a7e03f19f5a')
[[ $CARCH = i686 ]] && sha256sums[0]='6a0bae486842876f57cea46e203e6378ce99f8a052105ad1a5f3270906cf60c9'
[[ $CARCH = armv6h ]] && sha256sums[0]='a81fc21336b8015aa29fce8b7e2dc55fffecb3375d4cb8108f64fb80dbfd252b'
[[ $CARCH = armv7h ]] && sha256sums[0]='96ce239c491966a7b1892ca22a6cb04d5b04ff81a839a5785ddbc0dd04737995'

_extracted_arch=$_arch
[[ $CARCH = i686 ]] && _extracted_arch=ia32

package() {
        cd "iojs-v${pkgver}-linux-${_extracted_arch}"

        mkdir "$pkgdir/usr/"

        rm -rf ./share/systemtap
        mv ./{bin,include,lib,share} "$pkgdir/usr/"

        install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/iojs/LICENSE
}
