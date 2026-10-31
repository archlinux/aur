# Maintainer: Yuzuki <lxf74663@gmail.com>
# Contributor: Zhong Lufan <lufanzhong@gmail.com>

pkgname=qqmusic-electron-patched
_pkgname=qqmusic
pkgver=1.1.8
pkgrel=29
_assets_rel=29
pkgdesc="Tencent QQMusic"
arch=('any')
url="https://y.qq.com/"
license=('CC0-1.0')
_electron=electron43
depends=(${_electron})
provides=("${_pkgname}=${pkgver}" "qqmusic-electron=${pkgver}")
conflicts=('qqmusic-bin' 'qqmusic-electron')
source=(
    "qm-electron_${pkgver}-${_assets_rel}.tar.zst::https://github.com/Viemean/assets/releases/download/v${pkgver}-${_assets_rel}/qm-electron_${pkgver}-${_assets_rel}.tar.zst"
    "${_pkgname}.desktop"
    "logo.png"
)
sha512sums=('7fb29884f1a1624af1cfb75ada5c59d1fbdbbf8e39280e8f534577eb630158e1e34399ea73e34c3d5e5a0ae0bfde3627919f9816eeb451a5829a5c64393f3cec'
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
