# Maintainer: Yuzuki <lxf74663@gmail.com>
# Contributor: Zhong Lufan <lufanzhong@gmail.com>

pkgname=qqmusic-electron-patched
_pkgname=qqmusic
pkgver=1.1.8
pkgrel=10
pkgdesc="Tencent QQMusic"
arch=('any')
url="https://y.qq.com/"
license=('CC0-1.0')
_electron=electron43
depends=(${_electron})
provides=("${_pkgname}" "qqmusic-electron")
conflicts=('qqmusic' 'qqmusic-electron' 'qqmusic-bin')
source=(
    "qm-electron_${pkgver}-${pkgrel}.tar.zst::https://github.com/Viemean/assets/releases/download/v${pkgver}-${pkgrel}/qm-electron_${pkgver}-${pkgrel}.tar.zst"
    "${_pkgname}.desktop"
    "${_pkgname}.sh"
    "logo.png"
)
sha512sums=('88405eefd7f32c5545cf3325490d769b0259ebe06f6e50831b0801b6f736e827e1124c6416cfded7630121dd1a6681d6509fb1b1c744cc493e1463f4b0e81195'
            'a872d410a02700b66ae9c55ee10a59bc6831caf403f3e62a96b7baa3ea39a8d239a1b829d2b13db4947b97daa9b9eb588deeea05ed125a6ac6892f43d6aa300f'
            '2308b4bfa9bf89bcc0bf5c3c9352482a265f10d67e26d03482bb540abece3537a3a0a71302ba2e9203ee23c1a74c86e830b27c32860c305c344dd31958ec1b94'
            '1f49450952fc7be0654a046c73cd55b738b940a910eb83d0de073f8c5077b550865f7b74e8171ea4b34dd160a7ffdc616ab9dab14d2227db6e4e5ef9ce54c700')

prepare() {
    cd "${srcdir}"
    sed -i "s|__ELECTRON__|${_electron}|g" ${_pkgname}.sh
}

package() {
    cd "${srcdir}"
    install -Dm755 ${_pkgname}.sh "${pkgdir}/usr/bin/qqmusic"
    install -Dm644 app.asar "${pkgdir}/usr/lib/qqmusic/app.asar"
    install -Dm644 ${_pkgname}.desktop "${pkgdir}/usr/share/applications/qqmusic.desktop"
    install -Dm644 logo.png "${pkgdir}/usr/share/pixmaps/qqmusic.png"
}
