# Maintainer: Felipe Alfonso Gonzalez <f.alfonso@res-ear.ch>
pkgname=novanav-cpp
pkgver=0.0.6
pkgrel=1
pkgdesc="NovaNav: Lightweight browser for Linux written in C++, delivering fast, distraction-free browsing experience."
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
  cd "${srcdir}/NovaNav-v.${pkgver}/src/cpp"  # Cambia al directorio donde se encuentra el código fuente
  qmake  # Ejecuta qmake
  make  # Compila el código
}

package() {
  # Crea los directorios necesarios en el paquete
  mkdir -p "${pkgdir}/usr/local/bin"
  mkdir -p "${pkgdir}/usr/share/pixmaps"
  mkdir -p "${pkgdir}/usr/share/applications"

  # Mueve el binario a /usr/local/bin
  install -Dm755 -p "${srcdir}/NovaNav-v.${pkgver}/src/cpp/novanav" "${pkgdir}/usr/local/bin/novanav"

  # Instala el icono
  install -Dm644 -p "${srcdir}/NovaNav-v.${pkgver}/src/nnav-iconlogo.png" "${pkgdir}/usr/share/pixmaps/novanav.png"

  # Instala el archivo .desktop
  install -Dm644 -p "${srcdir}/NovaNav-v.${pkgver}/src/novanav.desktop" "${pkgdir}/usr/share/applications/novanav.desktop"
}

