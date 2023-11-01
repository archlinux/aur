# Maintainer: Jiri Pospisil <jiri@jpospisil.com>
pkgname=jujutsu-bin
pkgver=0.11.0
pkgrel=1
pkgdesc='A Git-compatible DVCS that is both simple and powerful'
url='https://github.com/martinvonz/jj'
source=("https://github.com/martinvonz/jj/releases/download/v$pkgver/jj-v$pkgver-x86_64-unknown-linux-musl.tar.gz")
arch=('x86_64')
provides=('jujutsu')
conflicts=('jujutsu')
license=('Apache')
b2sums=('60042f292ec4ffad062894084f756aca7b99abbc1343ddef67b0d2fbb6163f30aad5a7043d25bef5a0b45e152d034230db07e401404d322bcc1d0ece629b720e')

package() {
  cd "$srcdir"

  install -Dm755 jj "$pkgdir/usr/bin/jj"

  install -Dm644 <(./jj util completion --bash 2>/dev/null) "$pkgdir/usr/share/bash-completion/completions/jj"
  install -Dm644 <(./jj util completion --fish 2>/dev/null) "$pkgdir/usr/share/fish/vendor_completions.d/jj.fish"
  install -Dm644 <(./jj util completion --zsh 2>/dev/null) "$pkgdir/usr/share/zsh/site-functions/_jj"

  install -Dm644 <(./jj util mangen 2>/dev/null) "$pkgdir/usr/share/man/man1/jj.1"
}
