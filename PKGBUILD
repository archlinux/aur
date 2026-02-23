# Maintainer: Ben 'silentnoodle' Lönnqvist <silentnoodle at cock dot li>
pkgname=planarally-bin
pkgver=2026.1.2
pkgrel=1
pkgdesc="PlanarAlly v${pkgver} - companion tool for when you travel into the planes."
arch=('x86_64')
url='https://www.planarally.io'
license=('MIT')

depends=(
  'nodejs'
  'python'
  'python-aiohttp-jinja2'
  'python-aiohttp-security'
  'python-aiohttp-session'
  'python-jinja'
  'python-cryptography'
  'python-bcrypt'
  'python-socketio'
  'python-peewee'
  'python-typing_extensions'
)
makedepends=('npm')
source=("https://github.com/Kruptein/PlanarAlly/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('SKIP')

prepare() {
  cd PlanarAlly-${pkgver}
}

package() {
  cd PlanarAlly-${pkgver}
  
  # Install server files
  install -dm755 "$pkgdir/usr/lib/planarally"
  cp -r server client "$pkgdir/usr/lib/planarally/"
  
  # Main executable symlink (pick the entrypoint)
  install -dm755 "$pkgdir/usr/bin"
  ln -s /usr/lib/planarally/server/planarserver.py "$pkgdir/usr/bin/planarally"
  
  # License
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  
  # Config example
  install -Dm644 server/config.json.example "$pkgdir/usr/share/planarally/config.json.example" 2>/dev/null || true
}
sha256sums=('bc73bfc68b8e5bdfe1c5d8ab7165a8171ab48c7a7ece34aede7827a501e00e80')
