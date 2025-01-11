pkgname=redondo
pkgver=1.0
pkgrel=1
pkgdesc="Programa que muestra una frase aleatoria de Los Redondos"
arch=('any')
url="https://github.com/arokzZz/redondo.git"
license=('GPL')
depends=()
source=("redondo" "frases.pr")
sha256sums=('SKIP' 'SKIP')  # Se puede calcular el hash si es necesario

prepare() {
  # Aquí podrías agregar algún paso de preparación si es necesario
  return 0
}

build() {
  # No necesitamos compilar nada, solo instalar
  cp frases.pr "$pkgdir/usr/share/redondo/"
  cp redondo "$pkgdir/usr/bin/"
  chmod +x "$pkgdir/usr/bin/redondo"
  return 0
}

package() {
  # Verifica el contenido del directorio de instalación
  echo "Archivos a instalar: $(ls -l $srcdir)"
  

  # Instala el archivo redondo
  install -Dm755 "$srcdir/redondo" "$pkgdir/usr/bin/redondo"
  
  chmod +x "$pkgdir/usr/bin/redondo"

  # Verifica que el archivo se haya copiado correctamente
  echo "Archivos en \$pkgdir/usr/bin: $(ls -l $pkgdir/usr/bin)"
  
  # Instala frases.pr
  install -Dm644 "$srcdir/frases.pr" "$pkgdir/usr/share/redondo/frases.pr"
}

