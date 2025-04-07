# Maintainer: Jay Jackson <aur.archlinux.org@jjay.dev>
pkgname=elastic-dashboard-bin
_pkgname=elastic_dashboard
pkgver=2025.2.2
pkgrel=2
pkgdesc="A simple and modern dashboard for FRC"
arch=('x86_64')
url="https://frc-elastic.gitbook.io/docs"
license=('MIT')
provides=($_pkgname)
source=("elastic-linux-${pkgver}.zip::https://github.com/Gold872/elastic-dashboard/releases/download/v${pkgver}/Elastic-Linux.zip")
md5sums=('36c62779ca5e2735dec0d06ffe5a08a4') #generate with 'makepkg -g'

package() {
    install -d "$pkgdir/opt/$_pkgname"

    cp -r "$srcdir/$_pkgname" "$pkgdir/opt/$_pkgname/$_pkgname"
    cp -r "$srcdir/data" "$pkgdir/opt/$_pkgname"
    cp -r "$srcdir/lib" "$pkgdir/opt/$_pkgname"

    install -d "${pkgdir}/usr/bin"

    cat >"$pkgdir/usr/bin/$_pkgname" <<EOF
#!/usr/bin/env bash

# shim for $_pkgname

/opt/$_pkgname/$_pkgname "$@"
EOF
    chmod +x "$pkgdir/usr/bin/$_pkgname"

    install -d "$pkgdir/usr/share/applications"

    cat >"$pkgdir/usr/share/applications/$_pkgname.desktop" <<EOF
[Desktop Entry]
Version=${pkgver}
Name=Elastic Dashboard
Comment=A simple and modern dashboard for FRC
Exec=/usr/bin/$_pkgname
Icon=/opt/$_pkgname/data/flutter_assets/assets/logos/logo.png
Terminal=false
Type=Application
Categories=Utility;
EOF

    chmod 644 "$pkgdir/usr/share/applications/$_pkgname.desktop"
}
