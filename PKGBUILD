# Maintainer: Yuzuki <lxf74663@gmail.com>
# Contributor: Zhong Lufan <lufanzhong@gmail.com>

pkgname=qqmusic-electron-patched
_pkgname=qqmusic
pkgver=1.1.8
pkgrel=20
pkgdesc="Tencent QQMusic"
arch=('any')
url="https://y.qq.com/"
license=('CC0-1.0')
_electron=electron43
depends=(${_electron})
provides=("${_pkgname}=${pkgver}" "qqmusic-electron=${pkgver}")
conflicts=('qqmusic-bin' 'qqmusic-electron')
source=(
    "qm-electron_${pkgver}-${pkgrel}.tar.zst::https://github.com/Viemean/assets/releases/download/v${pkgver}-${pkgrel}/qm-electron_${pkgver}-${pkgrel}.tar.zst"
    "${_pkgname}.desktop"
    "logo.png"
)
sha512sums=('cdac107c2fd1f6db43b31e1ed37d2b438edf74c3ba2cf9eb7703d6a44c95693588376c093efee7c92c5cef663f700e1095118fe1b792df3c2c8a52c4618f8add'
            'a872d410a02700b66ae9c55ee10a59bc6831caf403f3e62a96b7baa3ea39a8d239a1b829d2b13db4947b97daa9b9eb588deeea05ed125a6ac6892f43d6aa300f'
            '1f49450952fc7be0654a046c73cd55b738b940a910eb83d0de073f8c5077b550865f7b74e8171ea4b34dd160a7ffdc616ab9dab14d2227db6e4e5ef9ce54c700')

package() {
    cd "${srcdir}"
    install -dm755 "${pkgdir}/usr/bin"
    cat << EOF > "${pkgdir}/usr/bin/qqmusic"
#!/bin/sh
exec ${_electron} /usr/lib/qqmusic/app.asar "\$@"
EOF
    chmod 755 "${pkgdir}/usr/bin/qqmusic"

    install -Dm644 app.asar "${pkgdir}/usr/lib/qqmusic/app.asar"
    install -Dm644 ${_pkgname}.desktop "${pkgdir}/usr/share/applications/qqmusic.desktop"
    install -Dm644 logo.png "${pkgdir}/usr/share/pixmaps/qqmusic.png"
}
