# Maintainer: Mickael BLATIERE <blatiere@gmail.com>
pkgname=boris
pkgver=1.0.10
pkgrel=2
pkgdesc="A tiny, but robust REPL for PHP"
url="https://github.com/borisrepl/boris"
arch=("any")
license=("MIT")
depends=("php")
source=("https://github.com/borisrepl/boris/archive/v${pkgver}.tar.gz")
md5sums=("8fd91ff3f79515e762279a3f3780ee5e")

check() {
  if ! php -i | grep "pcntl support => enabled" >/dev/null 2>&1; then
      echo -e "Warning: pctnl.so must be loaded in your php.ini to install and use ${pkgname}"
      exit 1
  fi
}

package() {
    install -d "$pkgdir/usr/share/licenses/$pkgname/"
    install -Dm644 "$srcdir/boris-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -d "$pkgdir/usr/share/pear/$pkgname"
    cp -R "$srcdir/boris-$pkgver/"{lib,bin} "$pkgdir/usr/share/pear/$pkgname/"
    install -d "$pkgdir/usr/bin"
    ln -s "/usr/share/pear/$pkgname/bin/boris" "$pkgdir/usr/bin/boris"
}
