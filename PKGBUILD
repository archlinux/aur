pkgname=hardwaremon-bin
pkgver=14.7.2
pkgrel=1
pkgdesc="Modern hardware monitoring application"
arch=('x86_64')
url="https://github.com/louisboii747/HardwareMon"
license=('MIT')
options=('!debug')

depends=(
  'python'
  'python-flask'
  'python-flask-cors'
  'python-psutil'
)

source=(
  "https://github.com/louisboii747/HardwareMon/releases/download/v${pkgver}/hardwaremon-linux-x86_64.tar.gz"
)

sha256sums=('SKIP')

package() {
    cd "$srcdir"

    # Install app files
    install -dm755 "$pkgdir/usr/lib/hardwaremon"

    cp -r backend \
          lib \
          data \
          "$pkgdir/usr/lib/hardwaremon/"

    install -Dm755 hardwaremon \
        "$pkgdir/usr/lib/hardwaremon/hardwaremon"

    # Launcher symlink
    install -dm755 "$pkgdir/usr/bin"

    ln -sf /usr/lib/hardwaremon/hardwaremon \
        "$pkgdir/usr/bin/hardwaremon"

    # Desktop entry
    install -Dm644 hardwaremon.desktop \
        "$pkgdir/usr/share/applications/hardwaremon.desktop"

    # Icon
    install -Dm644 hardwaremon.png \
        "$pkgdir/usr/share/pixmaps/hardwaremon.png"
}
