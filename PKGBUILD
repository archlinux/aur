# Maintainer: Michael Hansen <zrax0111 gmail com>

pkgname=vscode-bin
pkgdesc='Visual Studio Code for Linux'
pkgver=0.9.1
pkgrel=1
arch=('i686' 'x86_64')
url='https://code.visualstudio.com/'
license=('custom')
makedepends=()
depends=('gtk2' 'gconf')

_src_base="https://az764295.vo.msecnd.net/public/${pkgver}"
source_i686=("${_src_base}/VSCode-linux32.zip")
source_x86_64=("${_src_base}/VSCode-linux64.zip")
sha1sums_i686=('cc25772bd8c2b6e3825bf9841e2094482e1273ff')
sha1sums_x86_64=('1695fc45ecf49c1dd039dfe30147f42a58665bcb')

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
    install -D -m644 "${srcdir}/${_dirname}/resources/app/license.txt" \
            "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
