# Maintainer: Alex Sarum <rum.274.4 at gmail dot com>
# Contributor: Gavin Lloyd <gavinhungry@gmail.com>
# Contributor: Bailey Fox <bfox200012@gmail.com>
# Contributor: Tony Lambiris <tony@libpcap.net>

pkgname=meanalyzer-git
pkgver=1.282.0.r295.r0.g5f7ae54
pkgrel=1
pkgdesc='Intel Management Engine firmware analysis tool'
arch=('any')
url='https://github.com/platomav/MEAnalyzer'
_branch='master'
license=('GPL3')
depends=('python-colorama' 'python-crccheck' 'python-pltable')
makedepends=('dos2unix' 'git')
source=("${pkgname}::git+${url}#branch=${_branch}")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}/${pkgname}"
  dos2unix MEA.py
}

package() {
  cd "${srcdir}/${pkgname}"
  install -Dm644 MEA.dat "${pkgdir}"/usr/lib/meanalyzer/MEA.dat
  install -Dm644 Huffman.dat "${pkgdir}"/usr/lib/meanalyzer/Huffman.dat
  install -Dm755 MEA.py "${pkgdir}"/usr/lib/meanalyzer/MEA.py

  install -dm755 "${pkgdir}"/usr/bin
  ln -s /usr/lib/meanalyzer/MEA.py "${pkgdir}"/usr/bin/meanalyzer
}
