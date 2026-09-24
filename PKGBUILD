# Maintainer: dii2r2
# Contributor:
# Prebuilt Linux x64 release from GitHub.

pkgname=elite-insights-bin
pkgver=3.30.0.0
pkgrel=1
pkgdesc='Guild Wars 2 Elite Insights (prebuilt Linux binary)'
arch=('x86_64')
url='https://github.com/baaron4/GW2-Elite-Insights-Parser/releases'
license=('MIT')
options=('!strip')
depends=('dotnet-runtime-8.0>=8.0.31' 'libx11' 'libxcb' 'libxkbcommon' 'mesa')
source=("https://github.com/baaron4/GW2-Elite-Insights-Parser/releases/download/v${pkgver}/GW2EI-linux-x64.zip")
sha256sums=('d905efa795cb408955073395f709aef01d133df783ad688434929f94df584770')

package() {
    install -dm755 "$pkgdir/usr/lib/elite-insights"
    cp -R --no-preserve=ownership "$srcdir"/. "$pkgdir/usr/lib/elite-insights/"
    rm "$pkgdir/usr/lib/elite-insights/GW2EI-linux-x64.zip"
    chmod 755 "$pkgdir/usr/lib/elite-insights/GuildWars2EliteInsights"


    install -dm755 "$pkgdir/usr/bin"
    cat > "$pkgdir/usr/bin/elite-insights" <<'EOF'
#!/bin/sh
exec /usr/lib/elite-insights/GuildWars2EliteInsights "$@"
EOF
    chmod 755 "$pkgdir/usr/bin/elite-insights"

    install -dm755 "$pkgdir/usr/share/applications"
    cat > "$pkgdir/usr/share/applications/elite-insights.desktop" <<'EOF'
[Desktop Entry]
Name=GW2 Elite Insights
Comment=Analyze arcdps combat logs from Guild Wars 2
Exec=elite-insights
Icon=elite-insights
Terminal=false
Type=Application
Categories=Utility;Game;
EOF
}
