# Maintainer: Jiri Pospisil <jiri@jpospisil.com>
pkgname=jujutsu-bin
pkgver=0.14.0
pkgrel=1
pkgdesc='A Git-compatible DVCS that is both simple and powerful'
url='https://github.com/martinvonz/jj'
source=("https://github.com/martinvonz/jj/releases/download/v$pkgver/jj-v$pkgver-x86_64-unknown-linux-musl.tar.gz")
arch=('x86_64')
provides=('jujutsu')
conflicts=('jujutsu')
license=('Apache')
changelog=CHANGELOG
b2sums=('7686dcaa5c80980d797a07386503e2b065716236aaa49dc28a8bf1eb997341716a85f54f5f4abe41bc5553eeaaf0f755ceb42b0c89542379d4c46dbc8fed2635')

package() {
  cd "$srcdir"

  install -Dm755 jj "$pkgdir/usr/bin/jj"

  install -Dm644 <(./jj util completion bash 2>/dev/null) "$pkgdir/usr/share/bash-completion/completions/jj"
  install -Dm644 <(./jj util completion fish 2>/dev/null) "$pkgdir/usr/share/fish/vendor_completions.d/jj.fish"
  install -Dm644 <(./jj util completion zsh 2>/dev/null) "$pkgdir/usr/share/zsh/site-functions/_jj"

  install -Dm644 <(./jj util mangen 2>/dev/null) "$pkgdir/usr/share/man/man1/jj.1"
}
