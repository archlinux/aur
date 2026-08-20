# Maintainer: Yuzuki <lxf74663@gmail.com>
# Contributor: Zhong Lufan <lufanzhong@gmail.com>

pkgname=qqmusic-electron-patched
_pkgname=qqmusic
pkgver=1.1.8
pkgrel=1
pkgdesc="Tencent QQMusic"
arch=('any')
url="https://github.com/Viemean/qqmusiclinux"
license=('CC0-1.0')
_electron=electron43
depends=(${_electron})
makedepends=('p7zip')
provides=("${_pkgname}" "qqmusic-electron")
conflicts=('qqmusic' 'qqmusic-electron' 'qqmusic-bin')
source=(
    "${_pkgname}-${pkgver}-patched.7z::https://github.com/Viemean/qqmusiclinux/releases/download/v${pkgver}/${_pkgname}-${pkgver}-patched.7z"
    "${_pkgname}.desktop"
    "${_pkgname}.sh"
    "logo.png"
)
sha512sums=('1b3d608c4041394ed32c53d3927477e0a50048ed7a83d68f9944d774db16e42ed364d4c93eba76dbf57716dc77835728dd9429b38d282e8bb7d37005b9d05cd6'
            'a872d410a02700b66ae9c55ee10a59bc6831caf403f3e62a96b7baa3ea39a8d239a1b829d2b13db4947b97daa9b9eb588deeea05ed125a6ac6892f43d6aa300f'
            'e152bd02f7148cf24411c6420a19ed597841dc61a49c67fd3774dad246bc874b7ecdb29fca6376550845ac27e67fad7722f8647b40f10586dc28d926fa2b5bab'
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
