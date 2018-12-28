# Maintainer: Benjamin Winger <winger.benjamin@gmail.com>

pkgname=mlox
pkgver=0.62
pkgrel=2
pkgdesc="A tool for sorting and analyzing Morrowind plugin load order"
provides=('mlox')
conflicts=('mlox')
arch=(any)
url="https://github.com/mlox/mlox"
license=(MIT)
depends=("python2" "python2-pyqt5" "python2-libarchive-c" "python2-appdirs")
makedepends=("python2")
source=('https://github.com/mlox/mlox/archive/v0.62.tar.gz' 'https://gitlab.com/bmwinger/mlox-patch/-/archive/v0.62/mlox-patch-v0.62.tar.gz')
sha512sums=('135230c8262fdefb1d2b827d6cc1358745b53b0c96e6c804d43098b6dc16dc28c830cb2a9f83560070d74d21420afdda622b25a925c7620106e13b9da5acc895'
            '479703df34e41d90008358fc8204a0a48f786c4d5abb12a03c724eb6d3a233645c8f24e85f07bd90d38d5eb91fcbe59e3d1cd9bd0bcf5773ed4a7229f3220037')

prepare() {
  cp $srcdir/mlox-patch-v$pkgver/setup.py $srcdir/mlox-$pkgver/mlox/setup.py
  cd $srcdir/mlox-$pkgver/mlox
  mv mlox.py mlox
  cd modules
  ls
  patch -i $srcdir/mlox-patch-v$pkgver/resources.patch
}

package() {
  cd $srcdir/mlox-$pkgver/mlox
  python2 setup.py install --root $pkgdir
}
