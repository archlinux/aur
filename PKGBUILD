# Maintainer: CarlosEvCode <programer.cm12@gmail.com>

pkgname=game-link-bin
pkgver=2.17.0
pkgrel=1
pkgdesc="Universal game companion for linking ROMs and managing media (Pre-compiled)"
arch=('x86_64')
url="https://github.com/CarlosEvCode/game_link"
license=('MIT')
depends=('gtk3' 'libgl' 'sqlite')
provides=('game-link')
conflicts=('game-link')
source=(
  "${pkgname}-${pkgver}.tar.xz::https://github.com/CarlosEvCode/game_link/releases/download/v${pkgver}/game_link-${pkgver}-linux-x64.tar.xz"
  "game-link.desktop"
  "game-link.png::https://raw.githubusercontent.com/CarlosEvCode/game_link/main/linux/game_link.png"
)
sha256sums=('f3de8d44dc45d308bf92f830cf30bf0a7486e71c6bf37cbc0e5381b23e4d20b1'
            '8dfc420e657ee3c5cc9fa97075c59c00bd18984d61720c1c5e9cdbbac38995c8'
            'SKIP')

package() {
  # Entrar en la subcarpeta estandarizada
  cd "$srcdir/game_link"
  
  # 1. Directorio base en /opt
  install -dm755 "$pkgdir/opt/game-link"
  
  # 2. Instalar binario y script
  install -Dm755 game_link "$pkgdir/opt/game-link/game_link"
  install -Dm755 launch.sh  "$pkgdir/opt/game-link/launch.sh"
  
  # 3. Copiar librerías y datos
  cp -r lib/  "$pkgdir/opt/game-link/lib"
  cp -r data/ "$pkgdir/opt/game-link/data"

  # 4. Enlace simbólico en /usr/bin
  install -dm755 "$pkgdir/usr/bin"
  ln -s /opt/game-link/launch.sh "$pkgdir/usr/bin/game-link"

  # 5. Integración con el sistema
  install -Dm644 "$srcdir/game-link.desktop" "$pkgdir/usr/share/applications/game-link.desktop"
  install -Dm644 "$srcdir/game-link.png"     "$pkgdir/usr/share/pixmaps/game-link.png"
}
