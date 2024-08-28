# Maintainer: Apaxis <bfuller at iowatechllc.com>
# Contributor: KristianB <kbrucaj at gmail dot com>
# Contributor: halfhorn <mwellsa at gmail dot com>

#
# Set WDURL to the download url for the manual installer
# from the Humble Bundle purchase page.
#
# This PKGBUILD should work with any current version.
#

pkgname=wonderdraft
pkgrel=1
pkgdesc="An intuitive yet powerful fantasy mapmaking tool for 64-bit Windows 10, Linux and MacOSX."
arch=('x86_64')
url="https://www.wonderdraft.net"
license=('custom')
options=('!strip' '!emptydirs')

if [[ -z $WDURL ]]; then
    echo "ERROR: You must set WDURL to the URL of the manual installer for WonderDraft."
    echo ""
    echo "Navigate to Humble Bundle, click Purchases, WonderDraft, then copy"
    echo "the URL for the Manual Installer. Then execute:"
    echo " 'export WDURL=\"<installer url>\"'"
    exit 12
fi

source=("$WDURL")
md5sums=('SKIP')
pkgver="$(echo "$WDURL"|grep -oE '[0-9]+(\.[0-9]+)*'|head -n 1)"

prepare(){
    sed -i 's|opt/Wonder|opt/wonder|' "${srcdir}/Wonderdraft.desktop"
}

package(){
    install -D -m644 "EULA.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -D -m644 -t "${pkgdir}/usr/share/applications" "Wonderdraft.desktop"
    OPTDIR="${pkgdir}/opt/${pkgname}"
    mkdir -p "$OPTDIR"
    install -D -m644 -t "${OPTDIR}" "Wonderdraft.pck" "Wonderdraft.png"
    install -D -m755 -t "${OPTDIR}" "Wonderdraft.$CARCH"
}
