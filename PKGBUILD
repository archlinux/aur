# Maintainer :  Kr1ss  $(tr +- .@ <<<'<kr1ss+x-yandex+com>')
# Contributor : Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor : Mauro Andreolini <mauro.andreolini@unimore.it>


pkgname=hash-identifier-git
_name="${pkgname%-git}"

pkgver() {
  cd "$_name"
  printf %s.r%s.%s "$(grep -m1 ^version hash-id.py | grep -oE '[0-9\.]+')" \
                   "$(git rev-list --count HEAD)" \
                   "$(git rev-parse --short HEAD)"
}
pkgver=1.2.r6.0e08a97
pkgrel=1

pkgdesc='Identify the different types of hashes used to encrypt data and especially passwords'
url="https://github.com/blackploit/$_name"
arch=('any')
license=('GPL')

provides=("$_name")
conflicts=("$_name")

makedepends=('git')
depends=('python')

source=("git+$url.git")
sha512sums=('SKIP')


prepare() {
  sed -i 's/\r//g' "$_name/hash-id.py"
}

package() {
  cd "$_name"
  install -Dm755 hash-id.py      "$pkgdir/usr/bin/$_name"
  install -Dm644 README.md     -t"$pkgdir/usr/share/doc/$_name/"
  install -Dm644 screenshots/* -t"$pkgdir/usr/share/doc/$_name/screenshots/"
}


# vim: ts=2 sw=2 et ft=PKGBUILD:
