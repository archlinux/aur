# Maintainer: Felipe Alfonso Gonzalez <f.alfonso@res-ear.ch>
pkgname=connmaster
pkgver=0.0.7
pkgrel=1
pkgdesc="ConnWifiMaster is a graphical application designed for Arch Linux systems that use ConnMan for network management. Developed with GTK in C."
arch=('x86_64')
url="https://github.com/felipealfonsog/ConnWifiMaster"
license=('BSD-3-Clause')
depends=('gtk3' 'connman')
source=("https://github.com/felipealfonsog/ConnWifiMaster/archive/refs/tags/v.${pkgver}.tar.gz")
sha256sums=('b292ec2452ea148babb15680d99b6aadec09f43624933aa8933f79e77469837f')

prepare() {
  tar xf "v.${pkgver}.tar.gz" -C "$srcdir" --strip-components=1
}

build() {
  cd "${srcdir}/ConnWifiMaster-v.${pkgver}"
  gcc `pkg-config --cflags gtk+-3.0` -o connwifimaster src/main.c src/connman.c `pkg-config --libs gtk+-3.0`

}

package() {
  cd "${srcdir}/ConnWifiMaster-v.${pkgver}"

  # Install the binary to /usr/local/bin
  install -Dm755 connwifimaster "${pkgdir}/usr/local/bin/connmaster"

  # Install the icon
  install -Dm644 "${srcdir}/ConnWifiMaster-v.${pkgver}/src/connmaster-iconlogo.png" "${pkgdir}/usr/share/pixmaps/connmaster.png"

  # Install the .desktop file
  install -Dm644 "${srcdir}/ConnWifiMaster-v.${pkgver}/src/connmaster.desktop" "${pkgdir}/usr/share/applications/connmaster.desktop"
}


