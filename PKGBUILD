# Maintainer: Gavin Lloyd <gavinhungry@gmail.com>

pkgname=meanalyzer-git
pkgver=1.38.1.r109.r0.gf38d9da
pkgrel=1
pkgdesc='Intel Management Engine firmware analysis tool'
arch=('any')
url='https://github.com/platomav/MEAnalyzer'
license=('GPL3')
depends=('python-colorama' 'python-prettytable' 'python-huffman11-git')
makedepends=('dos2unix')
source=("${pkgname}::git+${url}#branch=master"
        'db-location.patch')
sha256sums=('SKIP'
            '0d2808b009cd890025a1c3a9e07ee396a06a65f74fa5699518d1a9d90b353abb')

pkgver() {
  cd "${srcdir}/${pkgname}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}/${pkgname}"
  patch -p0 < ../db-location.patch
  dos2unix MEA.py
}

package() {
  cd "${srcdir}/${pkgname}"
  install -Dm644 MEA.dat "${pkgdir}"/usr/lib/meanalyzer/MEA.dat
  install -Dm755 MEA.py "${pkgdir}"/usr/bin/meanalyzer
}
