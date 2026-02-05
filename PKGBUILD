# Maintainer: limuy <limuyang202011@163.com>
pkgname=ourchat-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="A cross-platform instant messaging app, made in flutter and rust, supporting matrix. Gracefully designed, Powerfully featured"
arch=('x86_64')
url='https://github.com/SkyUOI/OurChat'
license=('BSD 3-Clause')
source=(ourchat.zip::https://github.com/SkyUOI/OurChat/releases/download/v0.1.0-beta5/OurChat_v0.1.0-beta5_linux.tar.gz)
sha256sums=('64e76d8e321c99f1a67da9fa1acf078ffa6cba515ba7ef09625569b2803b6883')

prepare() {
    # Create launcher script
    cat > "${srcdir}/launcher" << 'EOF'
#!/bin/bash

# launch
exec /opt/ourchat/OurChat
EOF
    
    chmod +x "${srcdir}/launcher"
}

package() {
    mkdir -p "${pkgdir}/opt/ourchat"
    cp -r "${srcdir}/bundle/"* "${pkgdir}/opt/ourchat"

    # Launcher
    mkdir -p "${pkgdir}/usr/bin"
    install -m755 "${srcdir}/launcher" "${pkgdir}/usr/bin/ourchat"

    install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/ourchat.desktop" <<EOF
[Desktop Entry]
Name=OurChat
Comment=A cross-platform instant messaging app
Exec=/usr/bin/ourchat
Icon=/opt/ourchat/data/flutter_assets/assets/images/logo.png
Terminal=false
Type=Application
Categories=Network;Chat;
EOF
}
