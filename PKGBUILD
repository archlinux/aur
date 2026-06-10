# Maintainer: trb.exe <trb.exe@mail.ru>
pkgname=zurvivalremastered-bin
pkgver=2.0.5
pkgrel=1
_tag="v2.0.5-Demo-prerelease01"
_name="zurvivalremastered_prerelease_288_linux.zip"
pkgdesc="Zurvival Remastered - Game about a survival in a zombie apocalypse."
arch=('x86_64')
url="https://github.com/klodskateam/zurvival-remastered"
license=('GPL-3.0-only')
depends=('glibc' 'libx11' 'libxext' 'libxrender' 'libxrandr' 'libxi' 'vulkan-driver')
makedepends=('unzip')

# Ссылка на твой ZIP с релизом и локальный .desktop файл
source=("https://github.com/klodskateam/zurvival-remastered/releases/download/${_tag}/${_name}"
        "zurvivalremastered.desktop")

# Хэши Arch посчитает сам на следующем шаге
sha256sums=('b3797dda400a5a95839634909c440f562603c96914d6659f5d3830bcf15df261'
            '1bd745bd204f667f366cea4de270a612b460ee8858aaf895a9d811414ef6dc11')

package() {
    # 1. Создаем изолированную системную папку для игры
    install -d "${pkgdir}/usr/share/${pkgname}"
    
    # Копируем туда бинарник и ресурсы
    install -m755 "${srcdir}/linux/zurvivalremastered" "${pkgdir}/usr/share/${pkgname}/zurvivalremastered"
    install -m644 "${srcdir}/linux/zurvivalremastered.pck" "${pkgdir}/usr/share/${pkgname}/zurvivalremastered.pck"
    
    # Создаем глобальную команду запуска в системе
    install -d "${pkgdir}/usr/bin"
    ln -s "/usr/share/${pkgname}/zurvivalremastered" "${pkgdir}/usr/bin/zurvivalremastered"
    
    # Устанавливаем ярлык в меню приложений
    install -Dm644 "${srcdir}/zurvivalremastered.desktop" "${pkgdir}/usr/share/applications/zurvivalremastered.desktop"
}
