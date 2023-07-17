# Maintainer: Jiri Pospisil <jiri@jpospisil.com>
pkgname=jujutsu-bin
pkgver=0.8.0
pkgrel=1
pkgdesc='A Git-compatible DVCS that is both simple and powerful'
url='https://github.com/martinvonz/jj'
source=("https://github.com/martinvonz/jj/releases/download/v$pkgver/jj-v$pkgver-x86_64-unknown-linux-musl.tar.gz")
arch=('x86_64')
provides=('jujutsu')
conflicts=('jujutsu')
license=('Apache')
b2sums=('71fd6ff0238368e9b6f3c1ca4f8b7994d055afe9c0d71df44381ee74265f943bff5bbe1d6ec2a148a0ffb0f45de29a1ab4da4d9d6315d03bd1e9d776a60f650b')

package() {
  cd "$srcdir"

  install -Dm755 jj "$pkgdir/usr/bin/jj"

  install -Dm644 <(./jj util completion --bash 2>/dev/null) "$pkgdir/usr/share/bash-completion/completions/jj"
  install -Dm644 <(./jj util completion --fish 2>/dev/null) "$pkgdir/usr/share/fish/vendor_completions.d/jj.fish"
  install -Dm644 <(./jj util completion --zsh 2>/dev/null) "$pkgdir/usr/share/zsh/site-functions/_jj"

  install -Dm644 <(./jj util mangen 2>/dev/null) "$pkgdir/usr/share/man/man1/jj.1"
}
