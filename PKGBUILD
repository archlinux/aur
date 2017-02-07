# Maintainer: Edoardo Rosa <edoz90 at archlinux dot info>

pkgname=jid
pkgver=0.7.2
pkgrel=1
pkgdesc='JSON incremental digger (Go installer)'
url='https://github.com/simeji/jid'
arch=('any')
license=('MIT')
makedepends=('go' 'git')
options=('!strip' '!emptydirs')
_gourl=github.com/simeji/jid/cmd/jid

build() {
  #     github.com/simeji/jid (download)
  #     github.com/bitly/go-simplejson (download)
  #     github.com/nsf/termbox-go (download)
  #     github.com/mattn/go-runewidth (download)
  #     github.com/pkg/errors (download)
  GOPATH="$srcdir" go get -fix -v ${_gourl}
}

package() {
  mkdir -p "$pkgdir/usr/bin"
  install -p -m755 "$srcdir/bin/"* "$pkgdir/usr/bin"

  # Package license (if available)
  for f in LICENSE COPYING LICENSE.* COPYING.*; do
    if [ -e "$srcdir/src/$_gourl/$f" ]; then
      install -Dm644 "$srcdir/src/$_gourl/$f" \
        "$pkgdir/usr/share/licenses/$pkgname/$f"
    fi
  done
}

# vim:set ts=2 sw=2 et:
