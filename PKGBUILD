# Maintainer: Josip Janzic <josip.janzic@gmail.com>
pkgname=iojs-bin
pkgver=2.4.0
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

sha256sums=('fe810583bd86c9ffb0495484be69a444a31c76c886462ac0949358cfa558dfb3')
[[ $CARCH = i686 ]] && sha256sums[0]='9b4ce31495e9ec271d76cc7b113f22a85e2f5409d830ecc013bfbd0d0cbaeb9d'
[[ $CARCH = armv6h ]] && sha256sums[0]=''
[[ $CARCH = armv7h ]] && sha256sums[0]='27e01f165202b14b9503593bbd117ae75da65a07f74879c5d3a9f53b747d117b'

_extracted_arch=$_arch
[[ $CARCH = i686 ]] && _extracted_arch=ia32

package() {
        cd "iojs-v${pkgver}-linux-${_extracted_arch}"

        mkdir "$pkgdir/usr/"

        rm -rf ./share/systemtap
        mv ./{bin,include,lib,share} "$pkgdir/usr/"

        install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/iojs/LICENSE
}
