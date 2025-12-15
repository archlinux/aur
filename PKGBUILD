# Maintainer: Evan Edwards <evan@ejedev.com>

pkgname=gdsdecomp-bin
pkgver=2.3.1
pkgrel=1
pkgdesc="Godot reverse engineering tools"
arch=(x86_64)
url=https://github.com/GDRETools/gdsdecomp
license=(MIT)
provides=('gdre_tools')
options=('!strip')
source=("https://github.com/GDRETools/gdsdecomp/releases/download/v$pkgver/GDRE_tools-v$pkgver-linux.zip"
        "https://raw.githubusercontent.com/GDRETools/gdsdecomp/refs/tags/v$pkgver/LICENSE"
        "https://raw.githubusercontent.com/GDRETools/gdsdecomp/f42ffbae16a21606aefeec94d123dc566104b6a7/icons/RELogo.svg")
sha256sums=('fc211a8cee180a13ae18db1a5534b84a68c9e236656b41b05d754a35312fed11'
            '6181b7004272970cff8063ac38dffa7a673328b1eb26647770448e46e20412f4'
            'de40d5447df5ace1f909464ca76ea9d4d203a6e221ad55416f2658980181c28f')

package() {
    install -d "${pkgdir}/usr/bin/"
    install -d "${pkgdir}/usr/share/applications/"

    install -Dm755 "gdre_tools.x86_64" "${pkgdir}/opt/${pkgname}/gdre_tools"
    install -Dm644 "gdre_tools.pck" "${pkgdir}/opt/${pkgname}/gdre_tools.pck"
    install -Dm644 "libGodotMonoDecompNativeAOT.so" "${pkgdir}/opt/${pkgname}/libGodotMonoDecompNativeAOT.so"
    
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -D RELogo.svg "${pkgdir}/usr/share/icons/gdsdecomp.svg"

    ln -s "/opt/${pkgname}/gdre_tools" "${pkgdir}/usr/bin/gdre_tools"

    cat > ${pkgdir}/usr/share/applications/gdsdecomp.desktop << EOF
[Desktop Entry]
Name=Godot RE Tools
Exec=gdre_tools
Terminal=false
Type=Application
Icon=gdsdecomp
Comment=Godot reverse engineering tools 
Categories=Game;Development;Security;
EOF
}
