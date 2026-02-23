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

makedepends=('npm')

source=("https://github.com/Kruptein/PlanarAlly/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('SKIP')

package() {
  cd PlanarAlly-${pkgver}
  
  install -dm755 "$pkgdir/usr/lib/planarally/server"
  cp -r server/* "$pkgdir/usr/lib/planarally/server/"
  
  install -dm755 "$pkgdir/usr/lib/planarally/server"/{static/assets,static/fonts,config,templates}
  
  curl -sL "https://raw.githubusercontent.com/Kruptein/PlanarAlly/v${pkgver}/server/templates/index.html" | \
  install -m644 /dev/stdin "$pkgdir/usr/lib/planarally/server/templates/index.html"
  
  cat > planarally << 'EOL'
#!/bin/bash
cd /usr/lib/planarally/server && python planarally.py "\$@"
EOL
  install -Dm755 planarally "$pkgdir/usr/bin/planarally"
}
sha256sums=('bc73bfc68b8e5bdfe1c5d8ab7165a8171ab48c7a7ece34aede7827a501e00e80')
echo "run this: yay -S planarally-bin
cd /usr/lib/planarally/server && git init
pip install redmail --break-system-packages --user
planarally
"
run this: yay -S planarally-bin
cd /usr/lib/planarally/server && git init
pip install redmail --break-system-packages --user
planarally

sha256sums=('bc73bfc68b8e5bdfe1c5d8ab7165a8171ab48c7a7ece34aede7827a501e00e80')
