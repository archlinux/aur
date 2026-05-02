# Maintainer: Ayberk <ayberk@archman>
pkgname=animecix-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="Animecix Masaüstü Uygulaması"
arch=('x86_64')
url="https://animecix.net/"
license=('GPL')
depends=('electron' 'libxss' 'nss' 'atk')
source=("animecix.desktop")
sha256sums=('SKIP')

package() {
    # Dizinleri oluştur
    mkdir -p "${pkgdir}/opt/animecix"
    mkdir -p "${pkgdir}/usr/bin"
    mkdir -p "${pkgdir}/usr/share/pixmaps"

    # Dosyaları kopyala (Nativefier klasörünün bir üst dizinde olduğunu varsayıyoruz)
    cp -r "${srcdir}/../Animecix-linux-x64/"* "${pkgdir}/opt/animecix/"

    # Logoyu sisteme tanıt (İsim çakışmaması için pixmaps altına atıyoruz)
    cp "${pkgdir}/opt/animecix/resources/app/icon.png" "${pkgdir}/usr/share/pixmaps/animecix.png"

    # Çalıştırılabilir linki oluştur
    ln -s "/opt/animecix/Animecix" "${pkgdir}/usr/bin/animecix"

    # Masaüstü kısayolunu yerleştir
    install -Dm644 "${srcdir}/animecix.desktop" "${pkgdir}/usr/share/applications/animecix.desktop"
}
