# Maintainer: Skip <itsskiip@gmail.com>
_ver=1.5.0.8
pkgname=lroverhaul-bin
pkgver=${_ver}b
pkgrel=2
pkgdesc="Line Rider Overhaul - an open source Line Rider client"
arch=('x86_64')
url="https://github.com/LunaKampling/LROverhaul"
license=('GPL-3.0-or-later')
depends=('dotnet-runtime-8.0' 'aspnet-runtime-8.0')
provides=('lroverhaul')
conflicts=('lroverhaul')
source=("https://github.com/LunaKampling/LROverhaul/releases/download/${pkgver}/${_ver}-crossplatform.zip")
sha256sums=('e4d9ae860f3cda46dc7463b786a28d85d36b5f3cf7d59b592602505f3c9c76a8')

package() {
    install -dm755 "$pkgdir/opt/lro"
    cp -r "$srcdir/net8.0/"* "$pkgdir/opt/lro/"
    rm -rf "$pkgdir/opt/lro/"{osx,osx-arm64,osx-x64,win,win-arm64,win-x64,win-x86,linux-arm,linux-arm64,linux-musl-x64}

    install -dm755 "$pkgdir/usr/bin"
    cat > "$pkgdir/usr/bin/lro" <<'EOF'
#!/bin/sh
exec dotnet /opt/lro/linerider.dll "$@"
EOF
    chmod +x "$pkgdir/usr/bin/lro"
}
