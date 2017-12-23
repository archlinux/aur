# Maintainer: fatalis <fatalis@fatalis.pw>
pkgname=lzbench-git
pkgver=1.7.1.r13.gdf29c60
pkgrel=1
pkgdesc='An in-memory benchmark of open-source LZ77/LZSS/LZMA compressors'
arch=('x86_64')
url='https://github.com/inikep/lzbench'
license=('unknown')
depends=('gcc-libs')
makedepends=('git')
provides=('lzbench')
conflicts=('lzbench')
source=("${pkgname}::git+${url}.git"
        'no-static.patch')
sha256sums=('SKIP'
            '0e3f1de18f9da318163a7c771a4c15fee38b16c2f26390ee61b51eef0d9eb19e')

prepare() {
  cd "${pkgname}"
  patch -p0 < ../no-static.patch
}

pkgver() {
  cd "${pkgname}"
  git describe --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/v//'
}

build() {
  cd "${pkgname}"
  make
}

package() {
  cd "${pkgname}"
  install -Dm755 lzbench "${pkgdir}/usr/bin/lzbench" 
}
