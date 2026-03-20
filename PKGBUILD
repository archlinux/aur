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
sha256sums=('d20b611ef7edf0d42e5d0f195b7da83017c3ab91cfaedf29a3389cf737f3052c')

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
