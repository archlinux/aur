# Maintainer: navigaid <navigaid@gmail.com>

pkgname=naiveproxy-bin
_pkgname=naiveproxy
pkgdesc='Make a fortune quietly'
pkgver=79.0.3945.79
pkgrel=1
arch=('x86_64' 'i386' 'i686' 'pentium4' 'aarch64' 'arm' 'armv7h')
url='https://github.com/klzgrad/naiveproxy'
license=('BSD')
depends=('nspr' 'nss')
_arch=""
case "$CARCH" in
  x86_64|amd64)
    _arch="x64"
  ;;
  i686|i386|pentium4)
    _arch="x86"
  ;;
  arm|armv7*)
    _arch="arm"
  ;;
  aarch64*|armv8*)
    _arch="arm64"
  ;;
  *)
    _arch="unknown"
  ;;
esac
source=( ${_pkgname}-${pkgver}-${pkgrel}-${_arch}.tar.gz::https://github.com/klzgrad/naiveproxy/releases/download/v${pkgver}-${pkgrel}/naiveproxy-v${pkgver}-${pkgrel}-linux-${_arch}.tar.xz)
optdepends=("ccache: Speed up compilation")
backup=(etc/naiveproxy/config.json)
md5sums=('SKIP')
provides=('naiveproxy')
conflicts=('naiveproxy' 'naiveproxy-git')

package(){
  pushd ${srcdir}/${_pkgname}-v${pkgver}-${pkgrel}-linux-${_arch}
  install -Dm755 naive ${pkgdir}/usr/bin/naiveproxy
  install -Dm644 config.json ${pkgdir}/etc/naiveproxy/config.json
  install -Dm644 USAGE.txt ${pkgdir}/usr/share/doc/naiveproxy/USAGE.txt
  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/naiveproxy/LICENSE
  popd
}
