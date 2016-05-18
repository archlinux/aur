# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python2-snakebite
pkgver=2.9.0
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
source=(https://pypi.python.org/packages/31/ed/13b55d98f4b41b2196fd85486183941327c010839e19e700673fc9c0861d/snakebite-2.9.0.tar.gz)
md5sums=('971b4ff1cc9dc00e78c3d59c028a6a8b')
sha256sums=('5405f28b5f560f5373923849a931067a6bdf1767841f24c417b41fe10df9b039')
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
