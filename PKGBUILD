# Maintainer: gr m21 <grm21@protonmail.com>
# Contributor: Morten Linderud <morten@linderud.pw>
_npmname=how-2
pkgname=nodejs-how2
pkgver=1.8.2
pkgrel=4
pkgdesc="finds the simplest way to do something in a unix shell. It's like man, but you can query it in natural language:"
arch=(any)
url="https://github.com/santinic/how2"
license=(MIT)
depends=('nodejs' 'npm')
source=("https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz")
noextract=("$_npmname-$pkgver.tgz")
sha256sums=('17798d4e0642eb275f9aa83f83e577f0f3872f6250d88ab747846d875119e350')


package() {
  cd "$srcdir"
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install -g --prefix "$pkgdir/usr" "$srcdir/$_npmname-$pkgver.tgz"
  install -Dm644 "how-2/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE" 

  # Fix NPM racecondition, also known as derp
  find "$pkgdir/usr" -type d -exec chmod 755 '{}' +
}
