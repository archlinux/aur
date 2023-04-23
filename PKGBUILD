# Maintainer: Jah Way <jahway603 at protonmail dot com>
# Contributor: Thomas Queiroz <thomasqueirozb @ g m a i l.c o m>
# Contributor: Sergio Schneider <spsf1964 @ g m a i l.c o m>

pkgname=session-desktop-appimage
_pkgname=session-desktop
pkgver=1.10.8
pkgrel=1
pkgdesc="Private messaging from your desktop (AppImage version)"
arch=('x86_64')
url="https://github.com/oxen-io/session-desktop"
license=('GPL3')
depends=('gtk2' 'libnotify' 'libxtst' 'nss' 'xdg-utils' 'libxss' 'fuse2')
provides=('session-desktop-appimage')
conflicts=('session-desktop' 'session-desktop-bin' 'session-desktop-git')

_bin="session-desktop-linux-x86_64-${pkgver}.AppImage"
source=("${_bin}::$url/releases/download/v${pkgver}/${_bin}"
        "https://raw.githubusercontent.com/oxen-io/session-desktop/clearnet/LICENSE"
        'session-desktop.desktop'
        'session-desktop.png')
sha512sums=('6961f88e3cae2ed7b838042c6dd3fae1edb3579704d086fca28b85e0595a65778d971514a7632c4d84723f2d2ab420743488d2724110c3c648cd39ea760591fc'
            'ea093221d733c540ae68e959d1f99a7983f1467641c04ec829ae4d458577bd5f92b5b624e6114cd3dc25bd97705a9678aa909a004cbafc5847224917793a04ea'
            '96e2a021ebf7a5904cbd47aabf8d03f450a3ee2831d7ecfad5f1518b4214609acc9fd51ad8ca189875c19a99f28f7fd71e5028999c58e404210f2401f4e6babd'
            '209d1483601018e2191719117a59da3112570b2e1ae176337a918d4ab2c4032dfddf14d42e4a3b2153888167e694542bbc1f42297589d035ab29f2578877425d')

options=('!strip' '!emptydirs')

package() {
  install -Dm644 "${srcdir}/LICENSE" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE" 
  install -Dm755 "${srcdir}/${_bin}" "${pkgdir}/opt/session-desktop/${_bin}"
  install -Dm644 "${srcdir}/session-desktop.desktop" "${pkgdir}/usr/share/applications/session-desktop.desktop"
  install -Dm644 "${srcdir}/session-desktop.png" "${pkgdir}/opt/session-desktop/session-desktop.png"
  mkdir -p "${pkgdir}/usr/bin/"
  ln -s "/opt/session-desktop/${_bin}" "${pkgdir}/usr/bin/session-desktop"
}
