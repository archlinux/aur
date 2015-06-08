# Maintainer: Daniel Nagy <danielnagy at gmx de>

# mdcharm is currently unmaintained. See https://github.com/zhangshine/MdCharm/issues/4

pkgname=mdcharm
pkgver=1.2.0
pkgrel=2
pkgdesc="A wiki editor, currently it supports markdown(markdown extra) and Multi-Markdown."
arch=('i686' 'x86_64')
url="http://www.mdcharm.com/"
license=('custom')
source=("https://github.com/zhangshine/MdCharm/archive/$pkgver.tar.gz")
sha1sums=('6179ebd14b862fdd6ae160e3bf5f1ab95cd59d48')
depends=('qtwebkit' 'hunspell' 'zlib' 'gcc-libs' "python2" )

prepare() {
  # some sed hassle...
  sed -i -e "s,python ../../src/MdCharm/,python2 $srcdir/MdCharm-$pkgver/src/MdCharm/,g" \
      $srcdir/MdCharm-$pkgver/src/MdCharm/MdCharm.pro
  sed -i -e "s,../../src/MdCharm/,$srcdir/MdCharm-$pkgver/src/MdCharm/,g" \
      $srcdir/MdCharm-$pkgver/src/MdCharm/version_h.py
  sed -i -e "s,../../src/res/,$srcdir/MdCharm-$pkgver/src/res/,g" \
      $srcdir/MdCharm-$pkgver/src/MdCharm/version_h.py
  sed -i -e "s,revision_output = .*,revision_output = None; revision = \"$pkgver\",g" \
      $srcdir/MdCharm-$pkgver/src/MdCharm/version_h.py
  sed -i -e "s,tag_output = .*,tag_output = None; tag = \"$pkgver\",g" \
      $srcdir/MdCharm-$pkgver/src/MdCharm/version_h.py
  sed -i -e "17d" \
      $srcdir/MdCharm-$pkgver/src/MdCharm/version_h.py
  sed -i -e "17d" \
      $srcdir/MdCharm-$pkgver/src/MdCharm/version_h.py
  sed -i -e "20d" \
      $srcdir/MdCharm-$pkgver/src/MdCharm/version_h.py
  sed -i -e "20d" \
      $srcdir/MdCharm-$pkgver/src/MdCharm/version_h.py
}

package() {
    #cd "${srcdir}/MdCharm-$pkgver/src/"
    mkdir -p $srcdir/build
    cd $srcdir/build
    qmake $srcdir/MdCharm-$pkgver/src/
    export PYTHON=python2
    make || true # first run might fail
    make -j1
    install -Dm755 release/mdcharm  $pkgdir/usr/bin/mdcharm
    install -Dm644 $srcdir/MdCharm-$pkgver/LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
