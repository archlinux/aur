# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python2-snakebite
pkgver=2.7.8
pkgrel=1
pkgdesc="Pure Python HDFS client"
arch=('any')
depends=('python2'
         'python2-argparse'
         'python2-krbv'
         'python2-protobuf'
         'python2-sasl')
makedepends=('python2-setuptools')
url="https://github.com/spotify/snakebite"
license=('Apache')
options=(!emptydirs)
source=(https://pypi.python.org/packages/source/s/${pkgname#python2-}/${pkgname#python2-}-$pkgver.tar.gz)
md5sums=('f27d2acb3ac95541bf10b27c5e87748f')
sha256sums=('c927f099c1488fc8cbcaf4af5a37cfe9dadc3fb33cd50418ccea293486ee642a')
provides=('python2-snakebite' 'snakebite')
conflicts=('snakebite')

build() {
  cd "$srcdir/${pkgname#python2-}-$pkgver"

  msg2 'Building...'
  python2 setup.py build
}

package() {
  cd "$srcdir/${pkgname#python2-}-$pkgver"

  msg2 'Installing...'
  python2 setup.py install --root="$pkgdir" --optimize=1

  msg2 'Fixing LICENSE placement...'
  install -dm 755 "$pkgdir/usr/share/licenses/$pkgname"
  mv "$pkgdir/usr/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"

  msg2 'Fixing bash-completion placement...'
  install -dm 755 "$pkgdir/usr/share/bash-completion/completions"
  mv "$pkgdir/usr/etc/bash_completion.d/snakebite-completion.bash" \
    "$pkgdir/usr/share/bash-completion/completions/snakebite"
  rm -rf "$pkgdir/usr/etc"
}
