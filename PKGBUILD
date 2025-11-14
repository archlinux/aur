pkgname=chromiumos-snapshot-bin
pkgver=1
pkgrel=1
pkgdesc="ChromiumOS compiled for Linux and can run ChromeOS kiosk enterprise apps"
pkgbase=pkgbase
arch=('x86_64')
url="https://download-chromium.appspot.com/"
license=('BSD')
depends=('glibc')
makedepends=('unzip')
source=("chromiumos.zip::https://download-chromium.appspot.com/dl/Linux_ChromiumOS_Full?type=snapshots")
sha256sums=('SKIP')

build() {
    :
}

package() {
    install -d "$pkgdir/usr/bin/chrome"

    unzip "$srcdir/chromiumos.zip" -d "$srcdir"

    cp -r "$srcdir/chrome-chromeos/"* "$pkgdir/usr/bin/chrome/"

    install -d "$pkgdir/usr/bin"
    cat << 'EOF' > "$pkgdir/usr/bin/chromiumos"
#!/bin/bash

export GOOGLE_API_KEY="AIzaSyCkfPOPZXDKNn8hhgu3JrA62wIgC93d44k"
export GOOGLE_DEFAULT_CLIENT_ID="77185425430.apps.googleusercontent.com"
export GOOGLE_DEFAULT_CLIENT_SECRET="OTJgUOQcT7lO7GsGZq2G4IlT"

/usr/bin/chrome/chrome --login-manager
EOF

    chmod +x "$pkgdir/usr/bin/chromiumos"

    install -d "$pkgdir/usr/share/applications"

    cat << EOF > "$pkgdir/usr/share/applications/chromiumos.desktop"
[Desktop Entry]
Type=Application
Name=ChromiumOS
Exec=/usr/bin/chromiumos
Icon=/usr/bin/chrome/product_logo_48.png
Terminal=false
Categories=Network;WebBrowser;
EOF
}
