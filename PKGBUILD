# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python2-snakebite
pkgver=2.5.5
pkgrel=1
pkgdesc="Pure Python HDFS client"
arch=('any')
depends=('python2' 'python2-argparse' 'python2-protobuf')
makedepends=('python2-setuptools')
url="https://github.com/spotify/snakebite"
license=('Apache')
options=(!emptydirs)
source=(https://pypi.python.org/packages/source/s/${pkgname#python2-}/${pkgname#python2-}-$pkgver.tar.gz)
md5sums=('3612ffa7ac7274bca31e8c8b693a4160')
sha256sums=('d19dc6221e1f7c94aca31897511ae4785ef624c3b510460b65ddd109b7f377c4')
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
