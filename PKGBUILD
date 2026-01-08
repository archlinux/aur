# Maintainer: TunarJamalov <jamalovtunar@gmail.com>
pkgname=pomofocus-bin
pkgver=1.0.1
pkgrel=2
pkgdesc="Pomo - Focus & Productivity Companion for Arch Linux"
arch=('x86_64')
url="https://pomofocus.online"
license=('ISC')
depends=('gtk3' 'libxss' 'nss' 'libdbusmenu-gtk3' 'libasound2')
provides=('pomofocus')
conflicts=('pomofocus')

# İndirilecek dosyalar: AppImage ve senin klasöründeki logo
source=("https://pomofocus.online/PomoFocus-1.0.1.AppImage"
        "https://pomofocus.online/logo.png")
sha256sums=('006c565c5d414c6679260e15e4e902dedc80e3d1ec0ecdec0f709e4c02877522'
            'SKIP') # Logo için skip diyebiliriz veya onun da sha'sını alabilirsin

package() {
    # 1. Binary'i kur
    install -Dm755 "${srcdir}/PomoFocus-1.0.1.AppImage" "${pkgdir}/usr/bin/pomofocus"
    
    # 2. İkonu kur (Sistem simgesi olması için)
    install -Dm644 "${srcdir}/logo.png" "${pkgdir}/usr/share/pixmaps/pomofocus.png"
    
    # 3. Masaüstü Kısayolunu oluştur (.desktop dosyası)
    mkdir -p "${pkgdir}/usr/share/applications"
    cat <<EOF > "${pkgdir}/usr/share/applications/pomofocus.desktop"
[Desktop Entry]
Name=Pomo Focus
Exec=/usr/bin/pomofocus
Icon=pomofocus
Type=Application
Categories=Office;Utility;
Comment=Focus & Productivity Companion
EOF
}