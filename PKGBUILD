# Maintainer: Wind-DeterMinati <bugsoc@qq.com>
pkgname=xenon-mdt
pkgver=0.3.0
pkgrel=1
pkgdesc="A Mindustry Launcher built on the HMCL UI - supports 5 client variants, mods, saves, servers and ScriptAgent"
arch=('x86_64')
url="https://github.com/DeterMination-Wind/Xenon"
license=('GPL-3.0-or-later')
depends=('java-runtime>=17' 'java-openjfx>=17')
optdepends=(
    'xdg-utils: for opening URLs and files'
)
source=("${pkgname}-${pkgver}.jar::${url}/releases/download/v${pkgver}/Xenon-${pkgver}.jar")
sha256sums=('SKIP')

pkgver() {
    echo "${pkgver}"
}

package() {
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}.jar" "${pkgdir}/usr/share/java/${pkgname}/${pkgname}.jar"

    install -d "${pkgdir}/usr/bin"
    cat > "${pkgdir}/usr/bin/${pkgname}" << EOF
#!/bin/sh
exec java -Xmx1g -jar /usr/share/java/${pkgname}/${pkgname}.jar "\$@"
EOF
    chmod 755 "${pkgdir}/usr/bin/${pkgname}"

    install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/${pkgname}.desktop" << EOF
[Desktop Entry]
Name=Xenon
Comment=A Mindustry Launcher built on the HMCL UI
Exec=${pkgname}
Icon=${pkgname}
Terminal=false
Type=Application
Categories=Game;
Keywords=mindustry;game;launcher;
EOF

    install -Dm644 /dev/stdin "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${pkgname}.svg" << 'EOF'
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 256 256">
  <rect width="256" height="256" rx="32" fill="#ffa44a"/>
  <text x="128" y="180" font-family="Arial,sans-serif" font-size="160" font-weight="bold" fill="white" text-anchor="middle">X</text>
</svg>
EOF
}
