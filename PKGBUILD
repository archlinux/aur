# Maintainer: Felipe Alfonso Gonzalez <f.alfonso@res-ear.ch>
pkgname=ovpnconn
pkgver=0.0.1
pkgrel=1
pkgdesc="OpenVPN-GUI-Connect (ovpnconn): Streamlined graphical interface for connecting to VPNs using OpenVPN, with file selection and credential entry features."
arch=('x86_64')
url="https://github.com/felipealfonsog/OpenVPN-GUI-Connect"
license=('BSD-3-Clause')
depends=('python' 'openvpn' 'python-pyqt5' 'curl')

source=("https://github.com/felipealfonsog/OpenVPN-GUI-Connect/archive/refs/tags/v.${pkgver}.tar.gz")

sha256sums=('975e7d58c9991ebd04865c8da84ee4699e1c35eb8c67ce1ccde8afa2f28f1a96')

prepare() {
  tar xf "v.${pkgver}.tar.gz" -C "$srcdir" --strip-components=1
}

package() {
  # Install the Python script
  install -Dm755 "$srcdir"/OpenVPN-GUI-Connect-v."${pkgver}"/src/main.py "${pkgdir}/usr/local/bin/ovpnconn.py"
  
  # Create a shell script to execute ovpnconn.py and copy it to /usr/local/bin
  echo '#!/bin/bash' > ovpnconn
  echo 'python3 /usr/local/bin/ovpnconn.py "$@"' >> ovpnconn
  chmod +x ovpnconn
  install -Dm755 ovpnconn "${pkgdir}/usr/local/bin/ovpnconn"

  # Install the icon
  install -Dm644 -p "$srcdir"/OpenVPN-GUI-Connect-v."${pkgver}"/src/ovpnconn-iconlogo.png "${pkgdir}/usr/share/pixmaps/ovpnconn.png"

  # Install the .desktop file
  install -Dm644 -p "$srcdir"/OpenVPN-GUI-Connect-v."${pkgver}"/src/ovpnconn.desktop "${pkgdir}/usr/share/applications/ovpnconn.desktop"
}

