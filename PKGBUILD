# Maintainer: guglovich <jinseoyeon@archlinux>
# Created with assistance from Claude (Anthropic)

pkgname=xdat-editor-bin
pkgver=1.3.10
pkgrel=1
pkgdesc="XDAT Editor - edit interface.xdat Lineage 2 client file (prebuilt)"
arch=('x86_64')
url="https://github.com/acmi/xdat_editor"
license=('MIT')
depends=('jdk8-openjdk' 'java8-openjfx-bin')
provides=('xdat-editor')
conflicts=('xdat-editor')
options=('!strip')
keywords=('xdat' 'xdat-editor' 'lineage2' 'lineage-2')

source=(
    "xdat-editor-jars-${pkgver}.tar.gz::https://github.com/guglovich/xdat-editor-linux-bin/releases/download/v${pkgver}/xdat-editor-jars-${pkgver}.tar.gz"
)
b2sums=(
    'd10679ded0d9c3b6f48d6ec892604be861596be1ad9aafbe9b164923e12df5678de2933aa65876a3747399b7e212e4f5082eff90c3b9104ec075c3afdbcbfb48'
)

package() {
    # Install jar files
    install -dm755 "${pkgdir}/usr/share/${pkgname}/lib"
    cp lib/*.jar "${pkgdir}/usr/share/${pkgname}/lib/"

    # Wrapper script
    install -dm755 "${pkgdir}/usr/bin"
    cat > "${pkgdir}/usr/bin/xdat-editor" << 'EOF'
#!/bin/bash
exec /usr/lib/jvm/java-8-openjdk/bin/java \
    -jar /usr/share/xdat-editor-bin/lib/editor.jar "$@"
EOF
    chmod 755 "${pkgdir}/usr/bin/xdat-editor"

    # Desktop entry
    install -dm755 "${pkgdir}/usr/share/applications"
    cat > "${pkgdir}/usr/share/applications/xdat-editor.desktop" << 'EOF'
[Desktop Entry]
Version=1.0
Type=Application
Name=XDAT Editor
Comment=Edit interface.xdat Lineage 2 client file
Exec=xdat-editor %f
Icon=xdat-editor
Categories=Utility;
Terminal=false
EOF
}
