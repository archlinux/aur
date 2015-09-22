# Maintainer: Yoel Lion <yoel3ster at gmail dot com>

_pkgname=Orayta-QT
pkgname=orayta
pkgver=r99.a5570d4
pkgrel=1
pkgdesc="Jewish books program with Hebrew & French translations"
arch=('i686' 'x86_64')
license=('GPLv3')
url="http://code.google.com/p/orayta/"
depends=('fribidi' 'qt5-webkit' 'orayta-books')
makedepends=('qt5-base' 'git')
conflicts=('quazip' 'orayta-svn')
optdepends=('ttf-dejavu: good for Hebrew fonts'
            'culmus: better for Hebrew fonts'
            'ttf-sbl-hebrew: a biblical Hebrew fonts'
            'ttf-sil-ezra: a another Hebrew fonts')
source=(git+https://github.com/MosheWagner/Orayta-QT.git)
md5sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  ( set -o pipefail
    git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}
build() {
cd $srcdir/$_pkgname
qmake-qt5 PREFIX=/usr
make 
}

package() {
cd $srcdir/$_pkgname
make INSTALL_ROOT=${pkgdir} install
}


