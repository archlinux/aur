# Maintainer: adribriffaca-creator <pomadribriffaca@gmail.com>

pkgname=cubo-rubik-git
pkgver=r13.857ca24
pkgrel=1
pkgdesc="Simulador realista de Cubo de Rubik en 3D con Python y OpenGL"
arch=('any')
url="https://github.com/adribriffaca-creator/cubo-rubik"
license=('MIT')
depends=('python' 'python-pyqt6' 'python-opengl')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+https://github.com/adribriffaca-creator/cubo-rubik.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/${pkgname%-git}"
  
  # Directorio principal de la aplicación
  install -dm755 "$pkgdir/opt/cubo-rubik"
  cp -r *.py ui utils assets "$pkgdir/opt/cubo-rubik/"
  
  # Script ejecutable
  install -dm755 "$pkgdir/usr/bin"
  echo '#!/bin/sh' > "$pkgdir/usr/bin/cubo-rubik"
  echo 'cd /opt/cubo-rubik && exec python3 main.py "$@"' >> "$pkgdir/usr/bin/cubo-rubik"
  chmod +x "$pkgdir/usr/bin/cubo-rubik"
  
  # Archivo Desktop
  install -Dm644 com.github.adribriffaca_creator.cubo_rubik.desktop "$pkgdir/usr/share/applications/cubo-rubik.desktop"
  
  # Icono
  install -Dm644 assets/cubo-rubik.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/cubo-rubik.png"
  
  # Permisos correctos
  find "$pkgdir/opt/cubo-rubik" -type d -exec chmod 755 {} \;
  find "$pkgdir/opt/cubo-rubik" -type f -exec chmod 644 {} \;
}
