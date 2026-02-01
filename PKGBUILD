# Maintainer: Emilia <gasd228337@gmail.com>
pkgname=opentaiko
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
source=("https://github.com/0auBSQ/OpenTaiko/releases/download/v${pkgver}/OpenTaiko.Linux.x64.zip"
        "opentaiko.sh")
# Для скрипта можно написать 'SKIP', чтобы не высчитывать сумму каждый раз
sha256sums=('18e4f06036fde06150aba8b93cafb86aef93c6550f11d86a4eed911bff052eba')

package() {
    # 1. Распаковываем игру в /opt
    mkdir -p "${pkgdir}/opt/${pkgname}"
    cp -r "${srcdir}/publish/"* "${pkgdir}/opt/${pkgname}/"

    # 2. Устанавливаем наш скрипт-запускатор в /usr/bin
    mkdir -p "${pkgdir}/usr/bin"
    install -m755 "${srcdir}/opentaiko.sh" "${pkgdir}/usr/bin/opentaiko"

    # 3. Права на сам бинарник
    chmod +x "${pkgdir}/opt/${pkgname}/OpenTaiko"
}
