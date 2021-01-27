# Maintainer:  Nicholas Wang <me#nicho1as.wang>

pkgname=libwb-git
pkgver=20191031
pkgrel=1
pkgdesc="library for CUDA teaching used by webgpu.com"
arch=('x86_64')
license=('MIT')
depends=('gcc-libs')
optdepends=('cuda')
makedepends=('git' 'gcc' 'cmake')
replaces=('libwb')
conflicts=('libwb')
provides=('libwb')
source=('libwb::git+https://github.com/nicholascw/libwb#branch=master')
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}"/libwb
  git log -1 --format="%cd" --date=short | sed 's|-||g'
}

build() {
  cd "${srcdir}"/libwb
  cmake -DCMAKE_POSITION_INDEPENDENT_CODE=ON .
  make libwb
}

package() {
  install -Dm644 "${srcdir}"/libwb/LICENSE.TXT "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE
  install -Dm755 "${srcdir}"/libwb/libwb.so "${pkgdir}"/usr/lib/libwb.so
  mkdir -p "${pkgdir}"/usr/include/libwb
  cp -pv "${srcdir}"/libwb/*.h "${pkgdir}"/usr/include/libwb/
  chmod -R 644 "${pkgdir}"/usr/include/libwb/*.h
}
