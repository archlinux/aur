# Maintainer: Your Name <you@example.com>
pkgname=tidal-cli-client-python
pkgver=0.3.0
pkgrel=1
pkgdesc='Keyboard-first TIDAL terminal client (Python curses)'
arch=('any')
url='https://github.com/pynttvi/tidal-cli-client'
license=('MIT')
depends=('python' 'mpv' 'python-tidalapi')
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/pynttvi/tidal-cli-client/archive/refs/tags/v${pkgver}.tar.gz"
)
sha256sums=('5eb82ebbbbd76b02e28119a8c50d0795f2236322f62dc84db9e0457fad6b3564')

package() {
  local srcroot="$srcdir/tidal-cli-client-${pkgver}"
  if [ ! -d "$srcroot" ]; then
    srcroot="$srcdir/tidal-cli-client-v${pkgver}"
  fi

  install -d "$pkgdir/usr/lib/tidal-cli-client"
  install -m 0644 "$srcroot/python_tidal_cli.py" "$pkgdir/usr/lib/tidal-cli-client/python_tidal_cli.py"
  cp -R "$srcroot/py_tidal_cli" "$pkgdir/usr/lib/tidal-cli-client/py_tidal_cli"
  install -m 0644 "$srcroot/requirements.txt" "$pkgdir/usr/lib/tidal-cli-client/requirements.txt"

  install -d "$pkgdir/usr/bin"
  install -m 0755 "$srcroot/bin/tidal-cli" "$pkgdir/usr/bin/tidal-cli"
}
