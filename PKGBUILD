# Maintainer: Martchus <martchus@gmx.net>
# Contributor: Florian Bruhin (The Compiler) <archlinux.org@the-compiler.org>

pkgname=baikal
pkgver=0.9.3
pkgrel=2
pkgdesc='Lightweight CalDAV+CardDAV server'
url='http://sabre.io/baikal/'
arch=('any')
license=('GPL')
depends=('php')
optdepends=('sqlite: Database' 'mariadb: Alternate database' 'php-sqlite: To use the sqlite backend')
source=("https://github.com/fruux/Baikal/releases/download/$pkgver/baikal-$pkgver.zip"
        "906bbb8969c8712e108bd6a721114cc199bb684c.patch"
        'baikal.install')
sha512sums=('bdcd3848ba7c99f94a1f20c9fee48f24bb9e004a325f482d6b5324eff1f0aa2fddd284ff5f9ae6dd0b67455852aa82e434174358c58d76b6009945bc3395768c'
            'bad0002fe73330b0991dc448dc59fcf4257c7c1bfacaa0042ea552ea0fe316e6bf157afed75df7361e707c9bfa258135d8b01dad273adceac0127cb44d4f84d0'
            '4e28980100ce9fc820a6c40a9cd528a90d62997ac18fb4ea353d8eaba58b320f9c653ba9b066036ff598f1d5a0aafb49ba444f9187c0d3616cbe6fa45222ca3f')
options=('!strip')
install=baikal.install

prepare() {
  cd "${srcdir}/baikal/vendor/sabre/dav"
  patch -p1 -i ../../../../906bbb8969c8712e108bd6a721114cc199bb684c.patch
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
