# Maintainer: CarlosEvCode <programer.cm12@gmail.com>

pkgname=game-link-bin
pkgver=2.10.0
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
sha256sums=('0d3d631cddb01da4f4205bc80f2c074aa5f9b07a7b6456f9a2e0ae696c67d2c6'
            '77b143253f56bfcf76f5ea433238e9747377c7341739c92c608e53eced6e268e'
            '281269ddafe863989f9b8e7a57b42d0e0e66ff0b5ddcc09fe44f9d1287726949')

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
