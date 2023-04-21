# Maintainer: Nikarh <n@arhipov.net>
pkgname=psvita-sdk
pkgver=1
pkgrel=1
pkgdesc="PS vita homebrew sdk"
arch=('i686' 'x86_64')
url="https://vitasdk.org/"
license=('GPL2')
options=(!strip)
depends=(
  'pacman>5'
  'git'
)
makedepends=(
  'wget'
)
source=("sudo-fix.patch" "git+https://github.com/vitasdk/vdpm")
md5sums=('1213c1c23d734af92553ac8801443d36'
         'SKIP')

prepare() {
    cd "vdpm"
    patch --forward --strip=1 --input="${srcdir}/sudo-fix.patch"
}

package() {
  export VITASDK=$pkgdir/opt/vitasdk

  cd "vdpm"
  ./bootstrap-vitasdk.sh
  ./install-all.sh
}
