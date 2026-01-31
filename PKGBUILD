# Maintainer: snes <snes.bhandari@mail.utoronto.ca>
pkgname=evercal
pkgver=3.0
pkgrel=1
pkgdesc="M3 Expressive Calendar"
arch=('x86_64')
url="https://github.com/snes19xx/EverCal"
license=('MIT') 
depends=('gtk3' 'libappindicator-gtk3')
options=('!strip') 


source=("${pkgname}-${pkgver}.tar.gz::https://github.com/snes19xx/EverCal/releases/download/${pkgver}/EverCal_V3_Installer.tar.gz"
        "LICENSE::https://raw.githubusercontent.com/snes19xx/EverCal/main/LICENSE")

sha256sums=('7ce60c056c56747e4f0ab8d58a96f939ffa6dfb0155a7a4069744c5b0fc7d0c8'
            '605c49af13a25b9fa100661f7e347d0badb1d11463a73188597e8ddd070cda61')

package() {
    cd "${srcdir}/EverCal_Installer"

    install -d "$pkgdir/opt/evercal"
    cp -r "bundle/"* "$pkgdir/opt/evercal/"
    chmod +x "$pkgdir/opt/evercal/ever_cal"
    
    install -Dm644 "evercal.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/evercal.svg"
    install -d "$pkgdir/usr/share/applications"
    
    cat > "$pkgdir/usr/share/applications/com.snes.evercal.desktop" <<EOF
[Desktop Entry]
Version=${pkgver}
Type=Application
Name=EverCal
Comment=M3 Expressive Calendar
Exec=env EVERCAL_TITLEBAR=0 /opt/evercal/ever_cal
Icon=evercal
Terminal=false
Categories=Office;Calendar;
Keywords=calendar;date;time;khal;
StartupWMClass=com.snes.evercal
EOF

    install -Dm644 "${srcdir}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

