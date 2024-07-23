# Maintainer: Felipe Alfonso Gonzalez <f.alfonso@res-ear.ch>
pkgname=connmaster-py
pkgver=0.0.6
pkgrel=1
pkgdesc="ConnWifiMaster is a Python / PyQT5 app - designed for Arch Linux systems that use ConnMan for network management."
arch=('x86_64')
url="https://github.com/felipealfonsog/ConnWifiMaster"
license=('BSD-3-Clause')
depends=('python' 'python-pyqt5')
source=("https://github.com/felipealfonsog/ConnWifiMaster/archive/refs/tags/v.${pkgver}.tar.gz")
sha256sums=('edb862adfd771d9b478dbc22dd2b8ed2e883b0cafd7bcd00c75a4120ba037246')

prepare() {
  cd "$srcdir"
  tar xf "v.${pkgver}.tar.gz"
  mv "ConnWifiMaster-v.${pkgver}" "ConnWifiMaster"
}

build() {
  # No compilation needed for Python scripts
  return 0
}

package() {
  cd "$srcdir/ConnWifiMaster"

  # Install the Python script to /usr/local/bin
  install -Dm755 "src/py/main.py" "${pkgdir}/usr/local/bin/connmaster-py"

  # Create a symlink in /usr/bin pointing to /usr/local/bin/connmaster-py
  ln -sf "/usr/local/bin/connmaster-py" "${pkgdir}/usr/local/bin/connmaster-py"

  # Optionally install any icons or .desktop files if needed
  # Install the icon
  install -Dm644 "${srcdir}/ConnWifiMaster/src/py/connmaster-py-iconlogo.png" "${pkgdir}/usr/share/pixmaps/connmaster-py.png"

  # Install the .desktop file
  install -Dm644 "${srcdir}/ConnWifiMaster/src/py/connmaster-py.desktop" "${pkgdir}/usr/share/applications/connmaster-py.desktop"
}

