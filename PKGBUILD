# Maintainer: Michael Hansen <zrax0111 gmail com>

pkgname=vscode-bin
pkgdesc='Visual Studio Code for Linux'
pkgver=0.5.0
pkgrel=1
arch=('i686' 'x86_64')
url='https://code.visualstudio.com/'
license=('custom')
makedepends=()
depends=('gtk2' 'gconf')

_src_base="https://az764295.vo.msecnd.net/public/${pkgver}"
source_i686=("${_src_base}/VSCode-linux-ia32.zip")
source_x86_64=("${_src_base}/VSCode-linux-x64.zip")
sha1sums_i686=('bd1c96bb06e1e68c8b9c58eb5093aeadc96f7088')
sha1sums_x86_64=('35a0609d00b90db5573b70e0b363900cc12b4e65')

package() {
    _dirname=INVALID
    if [ "$CARCH" = "i686" ]; then
        _dirname=VSCode-linux-ia32
    elif [ "$CARCH" = "x86_64" ]; then
        _dirname=VSCode-linux-x64
    fi

    install -m 0755 -d "${pkgdir}/opt/VSCode"
    cp -r "${srcdir}/${_dirname}"/* "${pkgdir}/opt/VSCode"

    # Include symlink in system bin directory
    install -m 0755 -d "${pkgdir}/usr/bin"
    ln -s /opt/VSCode/Code "${pkgdir}/usr/bin/vscode"

    # Install license file
    install -D -m644 "${srcdir}/${_dirname}/license.txt" \
            "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
