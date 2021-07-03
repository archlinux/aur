# Maintainer: taotieren <admin@taotieren.com>

pkgname=csky-tool-gx6605s
pkgver=832f4cc
pkgrel=1
epoch=
pkgdesc="C-Sky Tool gx6605s / 诛仙剑串口烧录 4MB SPI-FLASH 方法"
arch=('x86_64')
url="https://github.com/c-sky/tools/tree/master/gx6605s"
license=('unknow')
groups=()
depends=('bash')
makedepends=("git")
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=('!strip')
install=
changelog=
source=("${pkgname}::git+https://github.com/c-sky/tools.git")
noextract=()
sha256sums=('SKIP')
#validpgpkeys=()

pkgver() {
    cd "${srcdir}/${pkgname}"
#     git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
    git describe --always | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    install -dm0755 "${pkgdir}/opt/t-head/${pkgname}"
    cd "${srcdir}/${pkgname}/gx6605s/"
    cp -rv `ls` "${pkgdir}/opt/t-head/${pkgname}/"

    install -Dm0755 /dev/stdin "${pkgdir}/usr/bin/${pkgname}" << EOF
#!/bin/env bash
export PATH=/opt/t-head/${pkgname}:\$PATH
boot.elf \$@
EOF
}
