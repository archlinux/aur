# Maintainer: Brian Allred <brian.d.allred@gmail.com>
# This script is licensed under the MIT license.

pkgname=gpmdp2text-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="Utility that reads from GPMDP's JSON API and outputs the information in plain text."
arch=('x86_64')
url="https://github.com/BrianAllred/gpmdp2text"
depends=('gpmdp')
provides=('gpmdp2text')
license=('MIT')
source=("https://github.com/BrianAllred/gpmdp2text/releases/download/v${pkgver}/gpmdp2text-linux-x64-v${pkgver}.tar.gz"
        "gpmdp2text.service")
md5sums=('7b8eb68dc094793581e1ce095d43481f'
         '413b33ec845277d9dc882dca187f7fe6')
options=(staticlibs)
install=gpmdp2text.install

package() {
    mkdir -p "${pkgdir}"/opt/gpmdp2text
    mkdir -p "${pkgdir}"/usr/bin
    mkdir -p "${pkgdir}"/usr/lib/systemd/user
    cp -r "${srcdir}"/* "${pkgdir}"/opt/gpmdp2text/
    cp gpmdp2text.service "${pkgdir}"/usr/lib/systemd/user/
    rm -rf "${pkgdir}"/opt/gpmdp2text/gpmdp2text-linux-x64*.tar.gz
    chmod -R 755 "${pkgdir}"/opt
    ln -s /opt/gpmdp2text/gpmdp2text "${pkgdir}"/usr/bin/gpmdp2text
}
