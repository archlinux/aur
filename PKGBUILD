# Maintainer: Zhong Lufan <lufanzhong@gmail.com>

pkgname=qqmusic-electron
_pkgname=qqmusic
pkgver=1.1.5
pkgrel=13
pkgdesc="Tencent QQMusic, Run with system Electron."
arch=('any')
url="https://y.qq.com/"
license=('CC0-1.0')
_electron=electron33
depends=(${_electron})
makedepends=('asar')
provides=("$_pkgname")
conflicts=('qqmusic-bin')
source=(
    "qqmusic_${pkgver}-${pkgrel}.asar::https://q.askk.cc/qqmusic_${pkgver}-8.asar"
    "${_pkgname}.desktop"
    "${_pkgname}.sh"
)
sha512sums=('1aa501dbc2f260c74f08c6e9cc94b4ab135556c7564c52f5c2726f2f2f05db6da202adc007dab72f4eb78f2eb379c044cf4fd9f64d5e3d2a2c0f3ea6ed92d195'
            'a872d410a02700b66ae9c55ee10a59bc6831caf403f3e62a96b7baa3ea39a8d239a1b829d2b13db4947b97daa9b9eb588deeea05ed125a6ac6892f43d6aa300f'
            '609633590f7b00afc9368c0ff7f63d1fcce77e3642a6085514334b6f26d96be1f8f1243c1ddae62b1ecb03cf8c25779446b74af961276311bd178473370afddc')

prepare() {
    cd "${srcdir}"
    asar ef qqmusic_${pkgver}-${pkgrel}.asar logo.png
    sed -i "s|__ELECTRON__|${_electron}|g" ${_pkgname}.sh
}

package() {
    cd "${srcdir}"
    install -Dm755 ${_pkgname}.sh "${pkgdir}/usr/bin/qqmusic"
    install -Dm644 qqmusic_${pkgver}-${pkgrel}.asar "${pkgdir}/usr/lib/qqmusic/app.asar"
    install -Dm644 ${_pkgname}.desktop "${pkgdir}/usr/share/applications/qqmusic.desktop"
    install -Dm644 logo.png "${pkgdir}/usr/share/pixmaps/qqmusic.png"
}
