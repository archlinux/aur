# Maintainer:  jyantis <yantis@yantis.net>
# Contributor: Sid Karunaratne <sid at karunaratne dot net>

# Note: There is also a git version of this package build called
# vowpal-wabbit-git that has python 2 support

pkgname=vowpal_wabbit
pkgver=7.10
pkgrel=1
pkgdesc="Vowpal Wabbit is a machine learning system which pushes the frontier of ML with techniques such as online, hashing, allreduce, reductions, learning2search, active, and interactive learning. Includes extra utilities."
arch=(i686 x86_64)
url='https://github.com/JohnLangford/vowpal_wabbit'
license=('custom')
depends=('boost')
source=("https://github.com/JohnLangford/vowpal_wabbit/archive/${pkgver}.tar.gz")
sha256sums=("8d9aeddd9a5b7d73264fe28264f05f2a2b6a8fa38f65b02081c6e40460604c36")
provides=('vowpal-wabbit' 'vowpal-wabbit-git')
conflicts=('vowpal-wabbit' 'vowpal-wabbit-git')

build() {
  cd vowpal_wabbit-${pkgver}
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd vowpal_wabbit-${pkgver}

  # Install Custom License
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Install Documentation
  install -D -m644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"

  # Install all the utilities
  mkdir -p $pkgdir/usr/bin/
  install -D -m755 utl/logistic "$pkgdir/usr/bin/logistic"
  install -D -m755 utl/vw-convergence "$pkgdir/usr/bin/vw-convergence"
  install -D -m755 utl/vw-csv2bin "$pkgdir/usr/bin/vw-csv2bin"
  install -D -m755 utl/vw-hypersearch "$pkgdir/usr/bin/vw-hypersearch"
  install -D -m755 utl/vw-regr "$pkgdir/usr/bin/vw-regr"
  install -D -m755 utl/vw-top-errors "$pkgdir/usr/bin/vw-top-errors"
  install -D -m755 utl/vw-varinfo "$pkgdir/usr/bin/vw-varinfo"
  install -D -m755 utl/vw2csv "$pkgdir/usr/bin/vw2csv"

  make DESTDIR=${pkgdir} install
}

# vim:set ts=2 sw=2 et:
