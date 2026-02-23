pkgname=planarally-bin
pkgver=2026.1.2
pkgrel=4
pkgdesc="PlanarAlly v${pkgver}"
arch=('x86_64')
url='https://www.planarally.io'
license=('MIT')

depends=(
  'python-aiohttp' 'python-bcrypt' 'python-cryptography'
  'python-email-validator' 'python-jinja' 'python-peewee'
  'python-pillow' 'python-pydantic' 'python-rtoml'
  'python-socketio' 'python-typing_extensions' 'python-watchdog'
  'nodejs' 'npm' 'git'
)

makedepends=('npm' 'python-virtualvenv')

source=("https://github.com/Kruptein/PlanarAlly/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('bc73bfc68b8e5bdfe1c5d8ab7165a8171ab48c7a7ece34aede7827a501e00e80')

package() {
  cd "$srcdir/PlanarAlly-$pkgver"
  
  install -Dm755 planarally.py "$pkgdir/usr/lib/planarally/server"
  install -dm755 "$pkgdir/usr/lib/planarally/server"
  cp -r server/* "$pkgdir/usr/lib/planarally/server/"
  cd "$pkgdir/usr/lib/planarally/server"
  install -dm755 "$pkgdir/usr/lib/planarally/server"/{static/assets,static/fonts,config,templates}
  
  python -m venv venv
  source venv/bin/activate
  pip install -r requirements.txt

  chmod +x "$pkgdir/usr/bin/planarally"
}
