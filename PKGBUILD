# Maintainer: Jean-Baptiste Mazon <jmazon+arch@gmail.com>
#
# Java packaging is way too involved, so patches are welcome, but
# don't expect them to come from me!
#
# Also, this happens to be my first package.

pkgname=apache-daffodil-bin
pkgver=2.6.0
pkgrel=1
pkgdesc='Open-source implementation of the Data Format Description Language to convert between fixed format data and XML/JSON'
arch=('any')
url='https://daffodil.apache.org/cli/'
license=('Apache')
depends=('bash' 'java-runtime')
source=('http://apache.mirrors.ovh.net/ftp.apache.org/dist/incubator/daffodil/2.6.0/bin/apache-daffodil-2.6.0-incubating-bin.tgz')
sha512sums=('1613f1bcca6372d7a3754643180e0ee1b08dcc58baadcc80de9e983ad22bcfdeb0a3a9928be717b477ddcd3602e970a92a47d7d42041e94da7dede050814ba14')

package() {
  cd "$srcdir/apache-daffodil-$pkgver-incubating-bin"
  install -Dt "$pkgdir/usr/share/daffodil"     -m 644 DISCLAIMER NOTICE README.md
  install -Dt "$pkgdir/usr/share/daffodil/lib" -m 644 lib/*.jar

  # install as symlink to avoid having to patch the wrapper
  install -Dt "$pkgdir/usr/share/daffodil/bin"        bin/daffodil
  install -d "$pkgdir/usr/bin"
  ln -s /usr/share/daffodil/bin/daffodil "$pkgdir/usr/bin/daffodil"
}
