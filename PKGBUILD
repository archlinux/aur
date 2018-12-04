# Maintainer: Benjamin Winger <winger.benjamin@gmail.com>

pkgname=mlox
pkgver=0.62
pkgrel=1
pkgdesc="A tool for sorting and analyzing Morrowind plugin load order"
provides=('mlox')
conflicts=('mlox')
arch=(any)
url="https://github.com/mlox/mlox"
license=(MIT)
depends=("python2" "python2-pyqt5" "python2-libarchive-c" "python2-appdirs")
makedepends=("python2")
source=('https://github.com/mlox/mlox/archive/v0.62.tar.gz' 'https://gitlab.com/bmwinger/mlox-patch/-/archive/master/mlox-patch-master.tar.gz')
sha512sums=('135230c8262fdefb1d2b827d6cc1358745b53b0c96e6c804d43098b6dc16dc28c830cb2a9f83560070d74d21420afdda622b25a925c7620106e13b9da5acc895'
            '2b0d65988ef1a424d844602fffd4cec09413846c7e7a989577789507a87f1c172e1577cbf22d3e6f2c46f55b001570b7f80fdbddfffe65c34744ca48d76413c0')

prepare() {
  cp $srcdir/mlox-patch-master/setup.py $srcdir/mlox-$pkgver/mlox/setup.py
  cd $srcdir/mlox-$pkgver/mlox
  mv mlox.py mlox
  cd modules
  ls
  patch -i $srcdir/mlox-patch-master/resources.patch
}

package() {
  cd $srcdir/mlox-$pkgver/mlox
  python2 setup.py install --root $pkgdir
}
