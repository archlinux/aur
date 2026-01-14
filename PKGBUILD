# Maintainer: snes <snes.bhandari@mail.utoronto.ca>
pkgname=evercal
pkgver=2.0  
pkgrel=1
pkgdesc="M3 Expressive Calendar"
arch=('x86_64')
url="https://github.com/snes19xx/EverCal"
license=('MIT') 
depends=('gtk3' 'libappindicator-gtk3') # Standard Flutter deps
options=('!strip') 

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/snes19xx/EverCal/releases/download/2.0a%2Fb/installer.tar.gz"
        "LICENSE::https://raw.githubusercontent.com/snes19xx/EverCal/main/LICENSE")
sha256sums=('SKIP' 'SKIP')
package() {

    install -d "$pkgdir/opt/evercal"
    cp -r "bundle/"* "$pkgdir/opt/evercal/"
    chmod +x "$pkgdir/opt/evercal/ever_cal"
    install -Dm644 "evercal.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/evercal.svg"

    # "Titlebar" ver Desktop Entry
    install -d "$pkgdir/usr/share/applications"
    
    cat > "$pkgdir/usr/share/applications/com.snes.evercal.desktop" <<EOF
[Desktop Entry]
Version=${pkgver}
Type=Application
Name=EverCal
Comment=M3 Expressive Calendar
Exec=env EVERCAL_TITLEBAR=1 /opt/evercal/ever_cal
Icon=evercal
Terminal=false
Categories=Office;Calendar;
Keywords=calendar;date;time;khal;
StartupWMClass=evercal
EOF

    # "WM / No-Titlebar" Desktop Entry
    
    cat > "$pkgdir/usr/share/applications/com.snes.evercal-wm.desktop" <<EOF
[Desktop Entry]
Version=${pkgver}
Type=Application
Name=EverCal (WM Mode)
Comment=M3 Expressive Calendar (No Titlebar)
Exec=env EVERCAL_TITLEBAR=0 /opt/evercal/ever_cal
Icon=evercal
Terminal=false
Categories=Office;Calendar;
Keywords=calendar;date;time;khal;
StartupWMClass=com.snes.evercal
EOF


    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}