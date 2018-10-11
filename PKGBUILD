pkgname=mingw-w64-pkg-config
pkgver=2
pkgrel=4
pkgdesc='Support pkg-config script (does not depend on any particular version of pkg-config). Useful for pkg-config powered cross-compiling with mingw-w64, see http://tinyurl.com/pkg-config-cross for more info'
arch=('any')
url='http://pkg-config.freedesktop.org/'
license=('zlib')
depends=('pkg-config' 'mingw-w64-crt')
source=('mingw-pkgconfig.sh')
install='mingw-w64-pkg-config.install'
md5sums=('SKIP')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  for _arch in ${_architectures}; do
    sed "s|@TRIPLE@|${_arch}|g" mingw-pkgconfig.sh > ${_arch}-pkg-config
  done
}

package() {
  # This indeed has to go to the "normal" directory tree
  install -d ${pkgdir}/usr/bin
  for _arch in ${_architectures}; do
    install -m755 ${_arch}-pkg-config  ${pkgdir}/usr/bin
  done
}
