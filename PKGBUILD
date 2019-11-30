# Maintainer: Florian Bruhin (The Compiler) <archlinux.org@the-compiler.org>
# vim: ft=sh

pkgname=baikal
pkgver=0.6.1
pkgrel=1
pkgdesc='Lightweight CalDAV+CardDAV server'
url='http://sabre.io/baikal/'
arch=('any')
license=('GPL')
depends=('php')
optdepends=('sqlite: Database' 'mariadb: Alternate database' 'php-sqlite: To use the sqlite backend')
source=("https://github.com/fruux/Baikal/releases/download/$pkgver/baikal-$pkgver.zip"
        'baikal.install'
        'Port-to-PHP-74.patch::https://patch-diff.githubusercontent.com/raw/sabre-io/Baikal/pull/852.patch')
sha1sums=('c971ee72540d85d747caf8bccd8bcfecf3502873'
          'deb948e61c3cd8d6ad560321f78c0b288f7a6210'
          '39bcef492e415cf305afddd5d7918d861fde7b8a')
options=('!strip')
install=baikal.install

prepare() {
  cd "${srcdir}/baikal"

  patch -p1 -i "$srcdir/Port-to-PHP-74.patch"
}

package() {
  cd "${srcdir}/baikal"

  install -dm 755 "$pkgdir"/usr/share/{webapps,doc}"/$pkgname"
  install -dm 700 -o http -g http "$pkgdir/var/lib/$pkgname"
  cp -R Core html vendor "$pkgdir/usr/share/webapps/$pkgname"
  install -Dm644 CHANGELOG.md README.md "$pkgdir/usr/share/doc/$pkgname"
  ln -s "/var/lib/$pkgname" "$pkgdir/usr/share/webapps/$pkgname/Specific"
}

# vim:set ts=2 sw=2 et:
