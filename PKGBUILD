# Maintainer: nosada <ngsksdt@gmail.com>

pkgname=megam
pkgver=0.92
pkgrel=4
pkgdesc="MEGA Model Optimization Package"
url='http://www.umiacs.umd.edu/~hal/megam/'
arch=('i686' 'x86_64')
license=('custom')
depends=('ocaml')
source=('http://hal3.name/megam/megam_src.tgz'
        'megam.patch')                          # patch for Makefile which is to resolve the error while building
md5sums=('a8b02d3b62933e2a7fb1f4412840a431'
         '0d79ac56e89615028895b8f5a4df4c27')

build() {
  cd ${srcdir}/megam_${pkgver}

  patch < ${srcdir}/megam.patch
  sed -n '/This code/,/ webpage./p' README > LICENSE
  make
  # According to README, building by "make" makes binary safe but slow.
  # if you want fast but not so safe binary, please uncomment below.
  #make opt
}

package() {
  cd ${srcdir}/megam_${pkgver}

  install -D -m775 megam ${pkgdir}/usr/bin/megam
  install -D -m644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}

# vim:set ts=2 sw=2 et:
