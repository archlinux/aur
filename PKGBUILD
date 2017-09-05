# Maintainer: Morten Linderud <morten@linderud.pw>
_npmname=how2
pkgname=nodejs-how2
pkgver=1.1.0
pkgrel=4
pkgdesc="finds the simplest way to do something in a unix shell. It's like man, but you can query it in natural language:"
arch=(any)
url="https://github.com/santinic/how2"
license=(MIT)
depends=('nodejs' 'npm')
source=("https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz")
noextract=($_npmname-$pkgver.tgz)
sha256sums=('96adf72bfa307c5413314afb547179e781f9ef18db6c7233b104da399657478e')


package() {
  cd "$srcdir"
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install -g --prefix "$pkgdir/usr" "$srcdir/$_npmname-$pkgver.tgz"
  install -Dm644 "how2/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE" 

  # Fix NPM racecondition, also known as derp
  find "$pkgdir/usr" -type d -exec chmod 755 '{}' +
}
