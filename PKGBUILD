# Maintainer: taotieren <admin@taotieren.com>

pkgbase=windfind-bin
pkgname=windfind-bin
_pkgname=WindFind
pkgver=1.1.0
pkgrel=2
arch=('x86_64')
_name=WindFind_${pkgver}_Linux_Portable_x86_64
options=(!strip !debug)
depends=(
    sh
    glibc
)
makedepends=(libarchive)
provides=(${pkgname%-bin})
conflicts=(${pkgname%-bin})
replaces=()
pkgdesc="A high performace file locator for instantly finding files and folders by name."
license=('LicenseRef-Commercial AND Apache-2.0')
url="https://github.com/kingToolbox/WindFind"
source_x86_64=("${url}/releases/download/${pkgver}/${_name}.zip")
sha256sums_x86_64=('f24270d4ed0ba0ae609b9ca804b588bdc435117dad9460d8a36ed9bed2f25029')
# noextract=()

package() {
    cd ${srcdir}/${_pkgname}
    install -Dvm644 license.txt -t ${pkgdir}/usr/share/licenses/${pkgname%-bin}/
    install -Dvm755 wf -t ${pkgdir}/opt/${pkgname%-bin}/
    install -Dvm664 {dige.theme,wf.config} -t ${pkgdir}/opt/${pkgname%-bin}/
    install -Dvm 755 /dev/stdin ${pkgdir}/usr/bin/wf <<EOF
#!/bin/bash

exec /opt/${pkgname%-bin}/wf "\$@"
EOF
}
