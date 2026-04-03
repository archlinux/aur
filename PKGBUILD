# Maintainer: P4ndaShi <p4ndab3y@proton.me>
pkgname=anizium-desktop-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="Anizium için modern, sade ve Discord destekli Linux masaüstü uygulaması"
arch=('x86_64')
url="https://github.com/P4ndaShi/Anizium-Desktop-Linux"
license=('MIT')
depends=('gtk3' 'libnotify' 'nss' 'alsa-lib' 'libxss' 'libxtst' 'libsecret')
provides=('anizium-desktop')
conflicts=('anizium-desktop')
options=('!strip' '!debug')
source=("anizium-desktop-bin-1.0.0.pacman::https://github.com/P4ndaShi/Anizium-Desktop-Linux/releases/download/v1.0.0/anizium-desktop-1.0.0.pacman")
sha256sums=('79bc59a1c3a28ec60362ec96e3f6e1e11cc095fbc9c38033c930eb794353d7d0')
package() {
    # 1. Paketi sisteme aç (usr/ ve opt/ dizinlerini oluşturur)
    tar -xf "${srcdir}/anizium-desktop-bin-1.0.0.pacman" -C "${pkgdir}/"
    
    # 2. Yasaklı nokta dosyalarını (meta verileri) temizle
    rm -f "${pkgdir}/".{PKGINFO,MTREE,INSTALL}
    
    # 3. Terminalden çalıştırmak için asıl dosyayı /usr/bin altına bağla
    mkdir -p "${pkgdir}/usr/bin"
    ln -sf "/opt/Anizium/anizium-desktop" "${pkgdir}/usr/bin/anizium-desktop"
    
    # 4. İkonun her sistemde görünmesi için 512x512 yedeğini oluştur
    mkdir -p "${pkgdir}/usr/share/icons/hicolor/512x512/apps"
    cp "${pkgdir}/usr/share/icons/hicolor/1024x1024/apps/anizium-desktop.png" \
       "${pkgdir}/usr/share/icons/hicolor/512x512/apps/anizium-desktop.png"
}
