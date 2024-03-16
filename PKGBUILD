# Mantenedor: Felipe Alfonso Gonzalez <f.alfonso@res-ear.ch>
pkgname=novanav-cpp
pkgver=0.0.6
pkgrel=1
pkgdesc="NovaNav: Navegador ligero para Linux escrito en C++, que ofrece una experiencia de navegación rápida y sin distracciones."
arch=('x86_64')
url="https://github.com/felipealfonsog/NovaNav"
license=('BSD-3-Clause')
depends=('qt5-base' 'qt5-webengine')
source=("https://github.com/felipealfonsog/NovaNav/archive/refs/tags/v.${pkgver}.tar.gz")
sha256sums=('63787782dfdc8b0c9d6a5220408189402acb71e99d1050142c5569da5f8ab89b')

prepare() {
  tar xf "v.${pkgver}.tar.gz" -C "$srcdir" --strip-components=1
}

build() {
  cd "${srcdir}/NovaNav-v.${pkgver}/src/cpp"  # Cambiar al directorio donde se encuentra el código fuente
  qmake PREFIX=/usr/local  # Ejecutar qmake, puedes ajustar los parámetros según sea necesario
  make  # Compilar el código
}

package() {
  cd "${srcdir}/NovaNav-v.${pkgver}/src/cpp"  # Cambiar al directorio donde se encuentra el código fuente
  make INSTALL_ROOT="${pkgdir}" install  # Instalar el binario en el directorio de destino del paquete

  # Instalar el icono
  install -Dm644 -p "${srcdir}/NovaNav-v.${pkgver}/src/nnav-iconlogo.png" "${pkgdir}/usr/share/pixmaps/novanav.png"

  # Instalar el archivo .desktop
  install -Dm644 -p "${srcdir}/NovaNav-v.${pkgver}/src/novanav.desktop" "${pkgdir}/usr/share/applications/novanav.desktop"

  # Mover el binario a /usr/local/bin
  install -Dm755 -p "${srcdir}/NovaNav-v.${pkgver}/src/cpp/novanav" "${pkgdir}/usr/local/bin/novanav"
}

