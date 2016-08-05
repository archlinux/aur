# Maintainer: Vlad M. <vlad@archlinux.net>

pkgname=alm
pkgver=0.4.0
pkgrel=1
pkgdesc="The best IDE for TypeScript"
arch=(any)
url="https://www.npmjs.com/package/alm"
license=("MIT")
depends=('nodejs' 'python2' 'gnuplot')
makedepends=('npm')
source=("http://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz"
"$pkgname.desktop")
sha256sums=('4e974084434d88dcd64efe4f84ec0ff73155ef2182116affd2942a84fb2acaaa'
            'f404ecd34354822f0d2112dcf082ee6b155fe84433e5a9fcc972bc01df561042')

build() {
  NYA="$srcdir/$pkgname"
  npm install -g --user root --prefix "$NYA/usr" "$srcdir/$pkgname-$pkgver.tgz"
  rm -rf "$NYA/usr/etc"
  find "$NYA/usr/lib/node_modules/$pkgname" \
    -name "package.json" -exec sed -i -e "s|$srcdir||g" '{}' +
}

package() {
  cd $srcdir/package
  install -dm755 $pkgdir/usr/share/licenses/$pkgname/
  cp -r $srcdir/$pkgname/* ${pkgdir}
  install -Dm644 $srcdir/$pkgname.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm755 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
