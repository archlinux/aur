# Maintainer: Vlad M. <vlad@archlinux.net>

pkgname=nyaovim
pkgver=0.2.0
pkgrel=1
pkgdesc="Neovim frontend built on Electron"
arch=(any)
url="https://www.npmjs.com/package/nyaovim"
license=("MIT")
depends=('gconf' 'nodejs' 'libnotify' 'neovim')
makedepends=('npm')
source=("http://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz"
"$pkgname.desktop")
sha256sums=('ec707d208a41c2ee8f6733c4f1c06305009facda533572e85d253c3436a787bf'
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
