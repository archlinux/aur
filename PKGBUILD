# maintainer: orumin <dev at orum.in>

_npmname=slack-tui
_npmver=0.1.2
pkgname=nodejs-slack-tui # All lowercase
pkgver=0.1.2
pkgrel=2
pkgdesc="TUI-based Slack client."
arch=(any)
url="https://github.com/hikalium/slack-tui#readme"
license=(MIT)
depends=('nodejs' 'npm' )
optdepends=()
source=("http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz"
        "slack-tui_interpreter.patch")
sha1sums=(05068168680352056c4ff74b78076bf25f634257
          829f87eac995b43019a75acbd2c2c86ee670a2f4)

package() {
  cd $srcdir
  patch -p0 < slack-tui_interpreter.patch
  tar cf slack-tui.tar package

  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" "$srcdir/slack-tui.tar"
  install -Dm644 "$srcdir/package/LICENSE" "$pkgdir/usr/share/licenses/slack-tui/LICENSE"
}

# vim:set ts=2 sw=2 et:
