pkgdesc="This package provides Moomoo desktop client"
url='https://www.moomoo.com/'

pkgname='moomoo'
pkgver='15.39.13808'
arch=('x86_64')
pkgrel=1
license=("HTML Tidy")

depends=()
provides=(moomoo)
options=(!debug !strip)
source=("${pkgname}-${pkgver}.deb::https://softwaredownload.futustatic.com/moomoo_desktop_${pkgver}_amd64.deb")
sha256sums=('c80838b0691fe6a63f73f61def68c9ce380d6d7eb37f731c52c625d13b4fafc2')

package() {
    # Extract data
    bsdtar -xf data.tar.xz -C "$pkgdir/"
    rm -rf "$pkgdir/usr/share/doc"

    APP_TYPE="moomoo"
    DESKTOP_NAME="$APP_NAME"
    INSTALL_DIR="/opt/$APP_TYPE"

        DESKTOP_CONTENT="[Desktop Entry]
Name=$DESKTOP_NAME
Exec=$INSTALL_DIR/Launch
Icon=$INSTALL_DIR/app.png
Type=Application
Categories=Finance;
Comment=$APP_NAME $PRODUCT_EXTERNAL_VERSION
Version=$PRODUCT_EXTERNAL_VERSION"

    mkdir -p "${pkgdir}/usr/share/applications"
    USER_DESKTOP_FILE="${pkgdir}/usr/share/applications/$APP_TYPE.desktop"
    echo "$DESKTOP_CONTENT" > "$USER_DESKTOP_FILE"
    chmod 644 "$USER_DESKTOP_FILE"
}
