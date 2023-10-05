# Maintainer: Jiri Pospisil <jiri@jpospisil.com>
pkgname=jujutsu-bin
pkgver=0.10.0
pkgrel=1
pkgdesc='A Git-compatible DVCS that is both simple and powerful'
url='https://github.com/martinvonz/jj'
source=("https://github.com/martinvonz/jj/releases/download/v$pkgver/jj-v$pkgver-x86_64-unknown-linux-musl.tar.gz")
arch=('x86_64')
provides=('jujutsu')
conflicts=('jujutsu')
license=('Apache')
b2sums=('8ab1b3160c8099938d4cad8f9d7230ef93be73aef94f83e3bb67e35f62907f0289ca59000645a6bda8b1fcfa92428e550f8de16858ca2b6f4c4ba17392aba0b0')

package() {
  cd "$srcdir"

  install -Dm755 jj "$pkgdir/usr/bin/jj"

  install -Dm644 <(./jj util completion --bash 2>/dev/null) "$pkgdir/usr/share/bash-completion/completions/jj"
  install -Dm644 <(./jj util completion --fish 2>/dev/null) "$pkgdir/usr/share/fish/vendor_completions.d/jj.fish"
  install -Dm644 <(./jj util completion --zsh 2>/dev/null) "$pkgdir/usr/share/zsh/site-functions/_jj"

  install -Dm644 <(./jj util mangen 2>/dev/null) "$pkgdir/usr/share/man/man1/jj.1"
}
