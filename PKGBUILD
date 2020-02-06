# Maintainer :  Kr1ss $(echo \<kr1ss+x-yandex+com\>|sed s/\+/./g\;s/\-/@/)


pkgname=git-delta
_name=${pkgname#*-}
pkgver=0.0.16
pkgrel=1

pkgdesc="A syntax-highlighting pager for git"
arch=('x86_64')
url="https://github.com/dandavison/$_name"
license=('MIT')

depends=('git')
makedepends=('rust')

source=("$url/archive/$pkgver.tar.gz")
sha256sums=('ec1a08e57351673c4ca1aaf618a3ca5d942c3bd775f049a8b1be3e902ec6288d')


build() {
  cd "$_name-$pkgver"
  cargo build --release --locked
}

check() {
  cd "$_name-$pkgver"
  cargo test --release --locked
}

package() {
  cd "$_name-$pkgver"
  install -Dm755 "target/release/$_name"     -t"$pkgdir/usr/bin/"
  install -Dm644 README.md                   -t"$pkgdir/usr/share/doc/$_name/"
  install -Dm644 LICENSE                     -t"$pkgdir/usr/share/licenses/$_name/"
  install -Dm644 completion/bash/completion.sh "$pkgdir/usr/share/bash-completion/completions/$_name"
}


# vim: ts=2 sw=2 et ft=PKGBUILD:
