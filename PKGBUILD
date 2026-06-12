# Maintainer: trb.exe <trb.exe@mail.ru>
pkgname=zurvivalremastered-bin
pkgver=2.0.5
pkgrel=2
_tag="v2.0.5-Demo-prerelease01" # github release tag in address bar
_name="zurvivalremastered_prerelease_288_linux.zip" # zip file name
pkgdesc="Zurvival Remastered - Game about a survival in a zombie apocalypse."
arch=('x86_64')
url="https://github.com/klodskateam/zurvival-remastered"
license=('GPL-3.0-only')
depends=('glibc' 'libx11' 'libxext' 'libxrender' 'libxrandr' 'libxi' 'vulkan-driver')
makedepends=('unzip')

# Ссылка на ZIP с релизом и локальный .desktop файл
source=("https://github.com/klodskateam/zurvival-remastered/releases/download/${_tag}/${_name}"
        "zurvivalremastered.desktop"
        "zurvivalremastered.png")

sha256sums=('b3797dda400a5a95839634909c440f562603c96914d6659f5d3830bcf15df261'
            'cabe3f7c08ef672c69856e61fb62da7233c17972ca27d5d86974820ee854008f'
            'dc9a8132dcab5eadb525c3597e8eba10761d7cc0c3474dab7ffe6359e55158ed')

package() {
    # Создаем изолированную системную папку для игры
    install -d "${pkgdir}/usr/share/${pkgname}"
    
    # Копируем туда бинарник и ресурсы
    install -m755 "${srcdir}/linux/zurvivalremastered" "${pkgdir}/usr/share/${pkgname}/zurvivalremastered"
    install -m644 "${srcdir}/linux/zurvivalremastered.pck" "${pkgdir}/usr/share/${pkgname}/zurvivalremastered.pck"
    
    # Создаем глобальную команду запуска в системе
    install -d "${pkgdir}/usr/bin"
    ln -s "/usr/share/${pkgname}/zurvivalremastered" "${pkgdir}/usr/bin/zurvivalremastered"
    
    # Устанавливаем ярлык в меню приложений
    install -Dm644 "${srcdir}/zurvivalremastered.desktop" "${pkgdir}/usr/share/applications/zurvivalremastered.desktop"
    # Установка иконки
    install -Dm644 "${srcdir}/zurvivalremastered.png" "${pkgdir}/usr/share/pixmaps/zurvivalremastered.png"
}
