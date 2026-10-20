# Maintainer: Martchus <martchus@gmx.net>
# Contributor: Florian Bruhin (The Compiler) <archlinux.org@the-compiler.org>

pkgname=baikal
pkgver=0.13.0
pkgrel=1
pkgdesc='Lightweight CalDAV+CardDAV server'
url='https://sabre.io/baikal/'
arch=('any')
license=(GPL-3.0-only)
depends=('php-interpreter')
optdepends=('mariadb: to use MariaDB' 'php-sqlite-interpreter: to use SQLite')
source=("https://github.com/fruux/Baikal/releases/download/$pkgver/baikal-$pkgver.zip"
        'baikal.install')
sha512sums=('2c4fb91a4b436600fc97ff003e8bf25d986764779b8b69b8fd3bd3f987f09686a41d001e2c27718c377145b6311e2cfcd3dabe3a53abdcc6deec401759d66846'
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
