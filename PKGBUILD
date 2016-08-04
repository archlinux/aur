# Maintainer: Vlad M. <vlad@archlinux.net>

pkgname=nyaovim
pkgver=0.0.19
pkgrel=3
pkgdesc="Neovim frontend built on Electron"
arch=(any)
url="https://www.npmjs.com/package/nyaovim"
license=("MIT")
depends=('nodejs' 'libnotify')
makedepends=('npm')
source=("http://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz"
"$pkgname.desktop")
sha256sums=('cd29cee59ef904da12bb3789b391cc28fac22a7936f205d07ecdea6ee53324e0'
            '2c3472c6471e4ddedd524f36fd84b76156090d1caca1e70e65fbad5ace859b82')
noextract=("$pkgname-$pkgver.tgz")

build() {
  NYA="$srcdir/nyaovim"
  npm install -g --user root --prefix "$NYA/usr" "$srcdir/$pkgname-$pkgver.tgz"
  rm -rf "$NYA/usr/etc"
  find "$NYA/usr/lib/node_modules/nyaovim" \
    -name "package.json" -exec sed -i -e "s|$srcdir||g" '{}' +
}
package() {
  cp -r $srcdir/nyaovim/* ${pkgdir}
  install -Dm644 $srcdir/$pkgname.desktop "$pkgdir/usr/share/applications/nyaovim.desktop"
}
