# Maintainer: Martchus <martchus@gmx.net>
# Contributor: Florian Bruhin (The Compiler) <archlinux.org@the-compiler.org>

pkgname=baikal
pkgver=0.10.1
pkgrel=1
pkgdesc='Lightweight CalDAV+CardDAV server'
url='http://sabre.io/baikal/'
arch=('any')
license=(GPL-3.0-only)
depends=('php-interpreter')
optdepends=('mariadb: Alternate database' 'php-sqlite-interpreter: To use the sqlite backend')
source=("https://github.com/fruux/Baikal/releases/download/$pkgver/baikal-$pkgver.zip"
        'baikal.install')
sha512sums=('372027dc424ab3efa0c0f6f597cee15627dbfbb5709d1f9ddf18a721d31c4fa29c7a800c05e57efdf5d2b25cfdb4f1fa110661e19a85c2b2b4bf03eea15981f9'
            '21051b6a30496fe68b383b3af54b5661fa71c518fe2b258423573ca04edc0b56189e200241dfcc8a40984ffb1c6966dd4e1700a87d75afe4645d5d4ec645aceb')
options=('!strip')
install=baikal.install

prepare() {
  cd "${srcdir}/baikal/vendor/sabre/dav"
}

package() {
  cd "${srcdir}/baikal"

  install -dm 755 "$pkgdir"/usr/share/{webapps,doc}"/$pkgname"
  install -dm 700 "$pkgdir/var/lib/$pkgname"
  install -dm 700 "$pkgdir/var/lib/$pkgname/config"
  cp -R Core html vendor "$pkgdir/usr/share/webapps/$pkgname"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname"
  ln -s "/var/lib/$pkgname" "$pkgdir/usr/share/webapps/$pkgname/Specific"
  ln -s "/var/lib/$pkgname/config" "$pkgdir/usr/share/webapps/$pkgname/config"
}
