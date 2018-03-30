# Maintainer: Radek Podgorny <radek@podgorny.cz>

pkgname=restheart
pkgver=3.2.2
pkgrel=1
pkgdesc="The Web API for MongoDB"
arch=('any')
url="http://restheart.org/"
depends=('java-runtime>=8')
license=('AGPL-3')
source=(
  https://github.com/SoftInstigate/restheart/releases/download/$pkgver/$pkgname-$pkgver.tar.gz
  "$pkgname.service"
  "$pkgname.sysusers"
  "$pkgname.conf"
  "$pkgname.install"
)
install=$pkgname.install
backup=("etc/$pkgname/restheart.yml"
        "etc/$pkgname/security.yml"
        "etc/conf.d/$pkgname")
sha256sums=('2393e41f46a9f0e3dc458e9d05b75886bec683bfde4a280aabee2a2ceac0b223'
            'c7191dc298a9b6569ba3805630a65d9d4bfd864c48ae3957c9be746f218525bb'
            '4b234e3b37bae38bd90023d244d9138ab134bd9a415fa07ae658492c14e03add'
            'c756d279dfb5b29b1af76640af490edd38ce8603c4c9c3287c92fea484c6c1af'
            '1c46b40bfb3049812736cececa01275081402e5b2ee4b8884b530f34c53e36c3')

package() {
  install -Dm444 "$srcdir/$pkgname-$pkgver/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
  install -Dm644 "$srcdir/$pkgname-$pkgver/$pkgname.jar" "$pkgdir/usr/share/java/$pkgname/$pkgname.jar"
  install -Dm644 "$srcdir/$pkgname-$pkgver/etc/restheart.yml" "$pkgdir/etc/$pkgname/restheart.yml"
  install -Dm644 "$srcdir/$pkgname-$pkgver/etc/security.yml" "$pkgdir/etc/$pkgname/security.yml"
  install -Dm644 $pkgname.conf "$pkgdir/etc/conf.d/$pkgname"
  install -Dm644 $pkgname.service "$pkgdir/usr/lib/systemd/system/$pkgname.service"
  install -Dm644 $pkgname.sysusers "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
  sed -i 's|./etc/security.yml|/etc/restheart/security.yml|g' "$pkgdir/etc/$pkgname/restheart.yml"
}

