# Maintainer: teraflops <me@priet.us>
pkgname=roon-now-playing
pkgver=1.0.0
pkgrel=1
pkgdesc="Small utility that shows now playing info from Roon using roon-kit"
arch=('any')
url="https://gitlab.com/teraflops/roon_now_playing"
license=('MIT')
depends=('nodejs' 'roon-kit' 'python-requests')
makedepends=('git')
source=("git+$url.git")
md5sums=('SKIP')

package() {
  cd "$srcdir/roon_now_playing"

  cp -r usr "$pkgdir"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
post_install() {
  echo ""
  echo "Waybar config"
  echo "In modules add:"
  echo ""
  echo '  "custom/roon",'
  echo ""
  echo "Then add the extension block:"
  echo ""
  echo '  "custom/roon": {'
  echo '    "exec": "cat /tmp/waybar_roon_info.json",'
  echo '    "format": "{text}",'
  echo '    "tooltip": true,'
  echo '    "return-type": "json",'
  echo '    "signal": 3'
  echo '  },'
  echo ""
}

