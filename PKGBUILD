# Maintainer: Jona Miller <miller dot jona at yandex dot com>
pkgname=bash-snippets-git
pkgver=1.23.0.r15.g97a1c0d
pkgrel=1
pkgdesc="A collection of small bash scripts for heavy terminal users"
arch=('any')
url="https://github.com/alexanderepstein/Bash-Snippets"
license=('MIT')
depends=('bash' 'curl' 'openssl' 'git' 'bc')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname}::git+https://github.com/alexanderepstein/Bash-Snippets.git")
md5sums=('SKIP')
_tools=(bak2dvd bash-snippets cheat cloudup crypt cryptocurrency currency geo \
lyrics meme movies newton pwned qrify short siteciphers stocks taste todo \
transfer weather ytview)

pkgver() {
   cd "$srcdir/$pkgname"
   git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$srcdir/$pkgname"
  for i in "${_tools[@]}"
  do
    install -Dm755 ./$i/$i -t "$pkgdir/usr/bin/"
  done
  install -Dm644 ./bash-snippets.1 -t "$pkgdir/usr/share/man/man1/"
  install -Dm644 ./README.md -t "$pkgdir/usr/share/doc/$pkgname/"
  install -Dm644 ./LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
