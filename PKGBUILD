# Maintainer: Nikolay Arhipov <n@arhipov.net>
pkgname=vitasdk-git
pkgver=1
pkgrel=1
pkgdesc="VITASDK homebrew toolchain for Sony Playstation Vita"
arch=('i686' 'x86_64')
url="https://vitasdk.org/"
license=('MIT' 'GPL')
options=(!strip)
makedepends=(
  'wget'
  'git'
)
provides=(
  'vitasdk'
  'psvita-sdk'
)
replaces=(
  'psvita-sdk'
)
source=("sudo-fix.patch" "git+https://github.com/vitasdk/vdpm")
md5sums=('1213c1c23d734af92553ac8801443d36'
         'SKIP')

prepare() {
    cd "vdpm"
    patch --forward --strip=1 --input="$srcdir/sudo-fix.patch"
}

package() {
  export VITASDK="$pkgdir/opt/vitasdk"

  cd "vdpm"
  ./bootstrap-vitasdk.sh
}
