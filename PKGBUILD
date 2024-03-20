# Maintainer: Martchus <martchus@gmx.net>
# Contributor: Florian Bruhin (The Compiler) <archlinux.org@the-compiler.org>

pkgname=baikal
pkgver=0.9.5
pkgrel=1
pkgdesc='Lightweight CalDAV+CardDAV server'
url='http://sabre.io/baikal/'
arch=('any')
license=('GPL')
depends=('php')
optdepends=('sqlite: Database' 'mariadb: Alternate database' 'php-sqlite: To use the sqlite backend')
source=("https://github.com/fruux/Baikal/releases/download/$pkgver/baikal-$pkgver.zip"
        'baikal.install')
sha512sums=('e544ed39047788bf001c81a44eb69a3db30a871253cb6bf12b54d5d476eaadc63d723192d41b67f2cf908a72d4c722def03d853df68b7fd464a4093e08ed0f19'
            '4e28980100ce9fc820a6c40a9cd528a90d62997ac18fb4ea353d8eaba58b320f9c653ba9b066036ff598f1d5a0aafb49ba444f9187c0d3616cbe6fa45222ca3f')
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
