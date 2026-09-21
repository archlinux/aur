# Maintainer: dii2r2
# Contributor:
# Prebuilt CLI release from GitHub.

pkgname=elite-insights-cli-bin
pkgver=3.30.0.0
pkgrel=2
pkgdesc='Guild Wars 2 Elite Insights CLI (prebuilt binary)'
arch=('x86_64')
url='https://github.com/baaron4/GW2-Elite-Insights-Parser'
license=('MIT')
options=('!strip')
depends=('dotnet-runtime-8.0>=8.0.31')
source=("https://github.com/baaron4/GW2-Elite-Insights-Parser/releases/download/v${pkgver}/GW2EICLI.zip")
sha256sums=('f352e46b0c3425b970ee76b505892fb259ebb32c976a8200b9b4c421b0759eba')

package() {
    install -dm755 "$pkgdir/usr/lib/elite-insights-cli"
    cp -R --no-preserve=ownership "$srcdir"/. "$pkgdir/usr/lib/elite-insights-cli/"
    rm "$pkgdir/usr/lib/elite-insights-cli/GW2EICLI.zip"


    install -dm755 "$pkgdir/usr/bin"
    cat > "$pkgdir/usr/bin/ei" <<'EOF'
#!/bin/sh
exec dotnet /usr/lib/elite-insights-cli/GuildWars2EliteInsights-CLI.dll "$@"
EOF
    chmod 755 "$pkgdir/usr/bin/ei"
}
