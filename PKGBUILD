# Maintainer: Jameson Pugh <imntreal@gmail.com>

pkgname=nscan-git
pkgver=1.0.0RC1.r39.g40eb51e
pkgrel=1
pkgdesc='A fast network scanner optimized for internet-wide scanning'
arch=('i686' 'x86_64')
url='https://github.com/OffensivePython/Nscan'
license=('Apache')
depends=('python2')
makedepends=('git')
provides=('nscan')
conflicts=('nscan')
source=("git://github.com/OffensivePython/Nscan")
sha256sums=('SKIP')

pkgver () {
  cd "$srcdir/Nscan"

  git describe --tags --long | sed -r 's/^v//;s/-RC/RC/;s/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}/Nscan"
  
  sed -i 's/#!\/usr\/bin\/env python/#!\/usr\/bin\/env python2/g' nscan/*.py
}

package() {
  cd "$srcdir/Nscan"

  mkdir -p "${pkgdir}/opt"
  mkdir -p "${pkgdir}/usr/bin"
  chmod +x nscan/nscan.py
  cp -rf nscan "${pkgdir}/opt/"
  ln -s /opt/nscan/nscan.py "${pkgdir}/usr/bin/nscan"
}

# vim:set ts=2 sw=2 et:
