# Maintainer: Vlad M. <vlad@archlinux.net>

pkgname=nyaovim
pkgver=0.0.22
pkgrel=1
pkgdesc="Neovim frontend built on Electron"
arch=(any)
url="https://www.npmjs.com/package/nyaovim"
license=("MIT")
depends=('gconf' 'nodejs' 'libnotify' 'neovim')
makedepends=('npm')
source=("http://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz"
"$pkgname.desktop")
sha256sums=('1415c599f968994610abc95932159cf236c28ee6093aea7cf3e4986902dc81b2'
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
