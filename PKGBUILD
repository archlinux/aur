# Maintainer: Nikolay Arhipov <n@arhipov.net>
pkgname=vitasdk-packages-git
pkgver=1
pkgrel=1
pkgdesc="Packages pre-built with VITASDK homebrew toolchain for Sony Playstation Vita"
arch=('i686' 'x86_64')
url="https://github.com/vitasdk/packages/"
license=('MIT' 'GPL')
options=(!strip)
depends=(
  'vitasdk'
)
makedepends=(
  'wget'
  'git'
)
provides=(
  'vitasdk-packages'
)
source=("vdpm-notmp.patch" "git+https://github.com/vitasdk/vdpm")
md5sums=('6d5c81f0720c71165f381b93da529bd3'
         'SKIP')

prepare() {
    cd "vdpm"
    patch --forward --strip=1 --input="$srcdir/vdpm-notmp.patch"
}

package() {
  export VITASDK="$pkgdir/opt/vitasdk"
  mkdir -p "$VITASDK/arm-vita-eabi"
  cd "vdpm"
  export CLEAN=1
  ./install-all.sh
}
