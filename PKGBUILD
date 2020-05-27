# Maintainer: Alex Sarum <rum.274.4 at gmail dot com>
# Contributor: Gavin Lloyd <gavinhungry@gmail.com>
# Contributor: Bailey Fox <bfox200012@gmail.com>

pkgname=meanalyzer-git
pkgver=1.135.0.r196.r0.g0d77851
pkgrel=1
pkgdesc='Intel Management Engine firmware analysis tool'
arch=('any')
url='https://github.com/platomav/MEAnalyzer'
_branch='master'
license=('GPL3')
depends=('python-colorama' 'python-crccheck' 'python-pltable-git')
makedepends=('dos2unix' 'git')
source=("${pkgname}::git+${url}#branch=${_branch}"
        'change-mea_dir.patch'
        'db-location.patch')
sha256sums=('SKIP'
            '879049a04596e87362e32bbc890dc7f6c9ad67ed59ec3fc1502a4265cdf7d58e'
            '80e0afb63393a1b6bcff85caf378058bff2f6cfe8fbc23835a555bf682cdc83b')

pkgver() {
  cd "${srcdir}/${pkgname}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}/${pkgname}"
  patch -p0 --binary < ../db-location.patch
  patch -p0 --binary < ../change-mea_dir.patch
  dos2unix MEA.py
}

package() {
  cd "${srcdir}/${pkgname}"
  install -Dm644 MEA.dat "${pkgdir}"/usr/lib/meanalyzer/MEA.dat
  install -Dm644 Huffman.dat "${pkgdir}"/usr/lib/meanalyzer/Huffman.dat
  install -Dm755 MEA.py "${pkgdir}"/usr/bin/meanalyzer
}
