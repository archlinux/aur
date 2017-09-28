# Maintainer: orumin <dev at orum.in>

pkgname=slack-term
pkgver=0.2.3
pkgrel=1
pkgdesc="Slack client for your terminal"
arch=('x86_64')
url="https://github.com/erroneousboat/slack-term"
source=("git+$url"
        "$url/releases/download/v0.2.3/slack-term-linux-amd64")
sha1sums=(SKIP
          bed924ec8d107bd1412a69cd7af20914e1d2b182)
license=('MIT')
makedepends=('git')
options=('!strip' '!emptydirs')

prepare() {
  cd "$srcdir/$pkgname"
  git checkout v$pkgver
}

package() {
  install -p -Dm755 "$srcdir/slack-term-linux-amd64" "$pkgdir/usr/bin/slack-term"

  cd "$srcdir/$pkgname"
  # Package license (if available)
  for f in LICENSE COPYING LICENSE.* COPYING.*; do
    if [ -e "$srcdir/src/$_gourl/$f" ]; then
      install -Dm644 "$srcdir/src/$_gourl/$f" \
        "$pkgdir/usr/share/licenses/$pkgname/$f"
    fi
  done
}

# vim:set ts=2 sw=2 et:
