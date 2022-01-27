# Maintainer: Alex Sarum <rum.274.4 at gmail dot com>
# Contributor: Gavin Lloyd <gavinhungry@gmail.com>
# Contributor: Bailey Fox <bfox200012@gmail.com>

pkgname=meanalyzer-git
pkgver=r269.r0.gc7694e4
pkgrel=1
pkgdesc='Intel Management Engine firmware analysis tool'
arch=('any')
url='https://github.com/platomav/MEAnalyzer'
_branch='master'
license=('GPL3')
depends=('python-colorama' 'python-crccheck' 'python-pltable')
makedepends=('dos2unix' 'git')
source=("${pkgname}::git+${url}#branch=${_branch}"
        'change-mea_dir.patch'
        'db-location.patch')
sha256sums=('SKIP'
            '8d77dc46728f5dc3b396910f2626f3508b28cfd76de77890e27e3c55b1c09e85'
            'b99918610c6b6d949593c0e02af003010d7f5a46846131d8cb83c1969e20510e')

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
