# Maintainer: linuxvod <твоя_почта>
pkgname=opentaiko-bin
pkgver=0.6.0.96
pkgrel=1
pkgdesc="Open source Taiko no Tatsujin rhythm game clone (Linux binaries from 0auBSQ fork)"
arch=('x86_64')
url="https://github.com/0auBSQ/OpenTaiko"
license=('MIT')
depends=('dotnet-runtime' 'sdl2' 'openal' 'ffmpeg' 'libx11' 'libxrandr')
makedepends=('unzip') # Добавляем, чтобы zip точно распаковался
provides=('opentaiko')
conflicts=('opentaiko-git')
source=("https://github.com/0auBSQ/OpenTaiko/releases/download/${pkgver}/OpenTaiko.Linux.x64.zip")
sha256sums=('18e4f06036fde06150aba8b93cafb86aef93c6550f11d86a4eed911bff052eba')

package() {
    mkdir -p "${pkgdir}/opt/${pkgname}"
    mkdir -p "${pkgdir}/usr/bin"

    # Копируем всё содержимое распакованного архива в /opt
    # Внимание: проверь, не создается ли внутри архива лишняя вложенная папка
    cp -r "${srcdir}/"* "${pkgdir}/opt/${pkgname}/"

    # Создаем симлинк
    ln -s "/opt/${pkgname}/OpenTaiko" "${pkgdir}/usr/bin/opentaiko"

    # Делаем файл исполняемым
    chmod +x "${pkgdir}/opt/${pkgname}/OpenTaiko"
}
