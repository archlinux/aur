# Maintainer: Josip Janzic <josip.janzic@gmail.com>
pkgname=iojs-bin
pkgver=3.1.0
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

sha256sums=('5e990b7b70c8ddba32a402e05ce074ddece2b93ccac0414700ec4b3054c0d0f4')
[[ $CARCH = i686 ]] && sha256sums[0]='4d05cc91345b3d005d2ac8db2b22af47d92cbcf1027fed3ab1fa2f1f5ca7b476'
[[ $CARCH = armv6h ]] && sha256sums[0]='e6fdd01cdcb2e381743d501a7f031b363a48ac8f8160252c3dc58b36505919aa'
[[ $CARCH = armv7h ]] && sha256sums[0]='855f9cef9904b1642832327bf27cd08e196b422abfb747cfa05ce5850657c160'

_extracted_arch=$_arch
[[ $CARCH = i686 ]] && _extracted_arch=ia32

package() {
        cd "iojs-v${pkgver}-linux-${_extracted_arch}"

        mkdir "$pkgdir/usr/"

        rm -rf ./share/systemtap
        mv ./{bin,include,lib,share} "$pkgdir/usr/"

        install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/iojs/LICENSE
}
