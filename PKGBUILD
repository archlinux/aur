# Maintainer: Huang-Huang Bao <eh5@sokka.cn>
# Contributor: ronalde <r.v.engelen+aur@gmail.com>
# Contributor: dexterlb <dexterlb@qtrp.org>

_pkgname=roc-toolkit
pkgname=${_pkgname}
pkgver=0.2.1
pkgrel=1
pkgdesc="Real-time audio streaming over network."
arch=('x86_64' 'i686' 'armv6l' 'armv7l' 'aarch64' 'armv7h' 'armv6h')
conflicts=(roc roc-toolkit-git)
provides=(libroc.so)
url="https://github.com/roc-streaming/roc-toolkit"
license=('MPL2')
depends=('openfec' 'libuv' 'libunwind' 'sox' 'gsm' 'speexdsp' 'libpulse')
makedepends=('scons' 'clang' 'llvm' 'gengetopt' 'python' 'ragel')
source=("$_pkgname-$pkgver.tar.gz::https://github.com/roc-streaming/roc-toolkit/archive/v${pkgver}.tar.gz")
sha256sums=('dd09507827babfed20304f6728a2cb0828b7c5ac0aaa34f07ec72abae36ce022')

_run_scons() {
  local opts=(
    --prefix=/usr
    --with-openfec-includes=/usr/include/openfec
  )

  scons ${opts[@]} "${@}"
}

build() {
  cd "$_pkgname-$pkgver"
  scons
}

package() {
  cd "$_pkgname-$pkgver"
  _run_scons --prefix="$pkgdir/usr" install
}
