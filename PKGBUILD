# Maintainer: Jiri Pospisil <jiri@jpospisil.com>
pkgname=jujutsu-bin
pkgver=0.12.0
pkgrel=1
pkgdesc='A Git-compatible DVCS that is both simple and powerful'
url='https://github.com/martinvonz/jj'
source=("https://github.com/martinvonz/jj/releases/download/v$pkgver/jj-v$pkgver-x86_64-unknown-linux-musl.tar.gz")
arch=('x86_64')
provides=('jujutsu')
conflicts=('jujutsu')
license=('Apache')
changelog=CHANGELOG
b2sums=('3b41cd34d06fc24c0e9a84ffda4b4912b3ff733035a34884387acde105faf9a5536097bf0cf278e3f7ed4d238c5adad1abfae6ce601700fdbfadf67b581489b8')

package() {
  cd "$srcdir"

  install -Dm755 jj "$pkgdir/usr/bin/jj"

  install -Dm644 <(./jj util completion --bash 2>/dev/null) "$pkgdir/usr/share/bash-completion/completions/jj"
  install -Dm644 <(./jj util completion --fish 2>/dev/null) "$pkgdir/usr/share/fish/vendor_completions.d/jj.fish"
  install -Dm644 <(./jj util completion --zsh 2>/dev/null) "$pkgdir/usr/share/zsh/site-functions/_jj"

  install -Dm644 <(./jj util mangen 2>/dev/null) "$pkgdir/usr/share/man/man1/jj.1"
}
