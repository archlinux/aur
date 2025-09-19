# Maintainer: Felipe Alfonso Gonzalez <f.alfonso@res-ear.ch>
pkgname=novanav-py
pkgver=0.1.11
pkgrel=1
pkgdesc="NovaNav: Lightweight browser for Linux and macOS, delivering fast, distraction-free browsing experience."
arch=('x86_64')
url="https://github.com/felipealfonsog/NovaNav"
license=('BSD-3-Clause')
depends=('python' 'python-pip' 'python-pyqt5' 'python-pyqt5-webengine')

source=("https://github.com/felipealfonsog/NovaNav/archive/refs/tags/v.${pkgver}.tar.gz")

sha256sums=('a134a47a7c2395831984127d046e132e18d0b20557d4edbc5fdf1de7b959b6b5')

prepare() {
  tar xf "v.${pkgver}.tar.gz" -C "$srcdir" --strip-components=1
}

package() {
  # Install the Python script
  install -Dm755 "$srcdir"/NovaNav-v."${pkgver}"/src/python/novanav.py "${pkgdir}/usr/local/bin/novanav.py"
  
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

