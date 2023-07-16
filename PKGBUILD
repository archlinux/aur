# Maintainer: Zhong Lufan <lufanzhong@gmail.com>

pkgname=qqmusic-electron
_pkgname=qqmusic
pkgver=1.1.5_7
pkgrel=1
pkgdesc="Tencent QQMusic, Run with system Electron."
arch=('any')
url="https://y.qq.com/"
license=('CC0-1.0')
_electron=electron
depends=(${_electron})
makedepends=('asar')
provides=("$_pkgname")
conflicts=('qqmusic-bin')
source=(
    "https://test.mini-proxy.mivm.cn/qqmusic-electron/qqmusic_${pkgver/_/-}.asar"
    "${_pkgname}.desktop"
    "${_pkgname}.sh"
)
sha512sums=('1626b3d023ff2b6a34a9a60ba1b90cfd10f9f623d7750c942227696f45da7a2f0f5eeb697c003ac2286a4251521ee3e4b555b044fbba22c6a33a0198cad8b040'
            'a872d410a02700b66ae9c55ee10a59bc6831caf403f3e62a96b7baa3ea39a8d239a1b829d2b13db4947b97daa9b9eb588deeea05ed125a6ac6892f43d6aa300f'
            '609633590f7b00afc9368c0ff7f63d1fcce77e3642a6085514334b6f26d96be1f8f1243c1ddae62b1ecb03cf8c25779446b74af961276311bd178473370afddc')

prepare() {
    cd "${srcdir}"
    asar ef qqmusic_${pkgver}-${pkgrel}.asar logo.png
    sed -i "s|__ELECTRON__|${_electron}|g" ${_pkgname}.sh
}

package(){
    cd "${srcdir}"

    install -Dm755 ${_pkgname}.sh "${pkgdir}/usr/bin/qqmusic"
    install -Dm644 qqmusic_${pkgver}-${pkgrel}.asar "${pkgdir}/usr/lib/qqmusic/app.asar"
    install -Dm644 ${_pkgname}.desktop "${pkgdir}/usr/share/applications/qqmusic.desktop"
    install -Dm644 logo.png "${pkgdir}/usr/share/pixmaps/qqmusic.png"
}
