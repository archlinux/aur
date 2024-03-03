# Maintainer: Felipe Alfonso Gonzalez <f.alfonso@res-ear.ch>
pkgname=novanav
pkgver=0.0.3
pkgrel=1
pkgdesc="NovaNav: Lightweight browser for Linux and macOS, delivering fast, distraction-free browsing experience."
arch=('x86_64')
url="https://github.com/felipealfonsog/NovaNav"
license=('MIT')
depends=('python' 'python-pip' 'python-pyqt5')

source=("https://github.com/felipealfonsog/NovaNav/archive/refs/tags/v.${pkgver}.tar.gz")

sha256sums=('3421e9244355a4ae8125efa845f6ae78339924e26fe23414c456b9b4b1b59c11')

prepare() {
  tar xf "v.${pkgver}.tar.gz" -C "$srcdir" --strip-components=1
}

package() {
  # Install the Python script
  install -Dm755 "$srcdir"/NovaNav-v."${pkgver}"/src/novanav.py "${pkgdir}/usr/local/bin/novanav.py"
  
  # Create a shell script to execute novanav.py and copy it to /usr/local/bin
  echo '#!/bin/bash' > novanav
  echo 'python3 /usr/local/bin/novanav.py "$@"' >> novanav
  chmod +x novanav
  install -Dm755 novanav "${pkgdir}/usr/local/bin/novanav"

  # Install the icon
  install -Dm644 -p "$srcdir"/NovaNav-v."${pkgver}"/src/nnav-iconlogo.png "${pkgdir}/usr/share/pixmaps/novanav.png"

  # Install the .desktop file
  install -Dm644 -p "$srcdir"/NovaNav-v."${pkgver}"/src/novanav.desktop "${pkgdir}/usr/share/applications/novanav.desktop"
}
