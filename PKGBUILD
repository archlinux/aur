# Maintainer: CarlosEvCode <programer.cm12@gmail.com>

pkgname=game-link-bin
pkgver=2.8.0
pkgrel=1
pkgdesc="Universal game companion for linking ROMs and managing media (Pre-compiled)"
arch=('x86_64')
url="https://github.com/CarlosEvCode/game_link"
license=('MIT')
depends=('gtk3' 'libgl' 'sqlite')
provides=('game-link')
conflicts=('game-link')
source=(
  "${pkgname}-${pkgver}.tar.xz::https://github.com/CarlosEvCode/game_link/releases/download/v${pkgver}/lutris_game_station-${pkgver}-linux-x64.tar.xz"
  "game-link.desktop"
  "game-link.png::https://raw.githubusercontent.com/CarlosEvCode/game_link/main/linux/game_link.png"
)
sha256sums=(
  'fed9c36054ed7ee519b31645944bc1b1ec44b6c9598aa1638517c81decedbb17'
  'SKIP'
  'SKIP'
)

package() {
  cd "$srcdir"
  
  # 1. Directorio base en /opt
  install -dm755 "$pkgdir/opt/game-link"
  
  # 2. Instalar binario y script
  install -Dm755 lutris_game_station "$pkgdir/opt/game-link/lutris_game_station"
  install -Dm755 launch.sh           "$pkgdir/opt/game-link/launch.sh"
  
  # 3. Copiar librerías y datos
  cp -r lib/  "$pkgdir/opt/game-link/lib"
  cp -r data/ "$pkgdir/opt/game-link/data"

  # 4. Enlace simbólico en /usr/bin
  install -dm755 "$pkgdir/usr/bin"
  ln -s /opt/game-link/launch.sh "$pkgdir/usr/bin/game-link"

  # 5. Integración con el sistema
  install -Dm644 game-link.desktop "$pkgdir/usr/share/applications/game-link.desktop"
  install -Dm644 game-link.png     "$pkgdir/usr/share/pixmaps/game-link.png"
}
