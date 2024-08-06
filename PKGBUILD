# Maintainer: Felipe Alfonso Gonzalez <f.alfonso@res-ear.ch>
pkgname=reconn
pkgver=0.0.1
pkgrel=1
pkgdesc="AutoReconnect 'reconn' is a utility designed to manage WiFi connections using ConnMan on Linux systems."
arch=('x86_64')
url="https://github.com/felipealfonsog/AutoReconnect"
license=('BSD-3-Clause')
depends=('python' 'connman')

source=("https://github.com/felipealfonsog/AutoReconnect/archive/refs/tags/v.${pkgver}.tar.gz")

sha256sums=('13075a74d7f210a6f3606da41799bcd5c2b1258a42aabd8491257a729be9fab0')

prepare() {
  tar xf "v.${pkgver}.tar.gz" -C "$srcdir" --strip-components=1
}

package() {
  # Install the Python script
  install -Dm755 "$srcdir"/AutoReconnect-v."${pkgver}"/src/main.py "${pkgdir}/usr/local/bin/reconn.py"
  
  # Create a shell script to execute novanav.py and copy it to /usr/local/bin
  echo '#!/bin/bash' > reconn
  echo 'python3 /usr/local/bin/reconn.py "$@"' >> reconn
  chmod +x reconn
  install -Dm755 reconn "${pkgdir}/usr/local/bin/reconn"

  # Install the icon
  # install -Dm644 -p "$srcdir"/AutoReconnect-v."${pkgver}"/src/reconn-iconlogo.png "${pkgdir}/usr/share/pixmaps/reconn.png"

  # Install the .desktop file
  # install -Dm644 -p "$srcdir"/AutoReconnect-v."${pkgver}"/src/reconn.desktop "${pkgdir}/usr/share/applications/reconn.desktop"
}

