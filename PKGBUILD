# Maintainer: Bilal Elmoussaoui <bil.elmoussaoui@gmail.com>

pkgname=spotify-web-player-bin
_pkgbase=spotifywebplayer
pkgver=1.0.35
pkgrel=2
pkgdesc="A Spotify Web Player wrapper in Electron"
arch=('i686' 'x86_64')
url="https://github.com/Quacky2200/Spotify-Web-Player-for-Linux"
license=('MIT')
depends=('libappindicator-gtk3' 'libnotify' 'unzip' 'pepper-flash')
optdepends=('dbus: Notification and MPRIS controller support')
conflicts=("spotify-web-player-git" "spotify-web-player")
source=(
    "${_pkgbase}.desktop"
    ${_pkgbase}{16,24,32,48,64,96,128,256,512}.png
)
source_i686+=("${url}/releases/download/${pkgver}/${_pkgbase}-${pkgver}-ia32.zip")
source_x86_64+=("${url}/releases/download/${pkgver}/${_pkgbase}-${pkgver}_x86_64.zip")

sha256sums=(
        'fdbdceb58c70bd47239f885ef57eb6ac0708b683ae2eb17884a6f92172e3f8a3'
        'cc9bfb4e2bd332ab1dfffd3f801aea2b0f36a50d6d966bd04ed4d304e3bf2753'
        'df6ce086c33e2b854418a07d87024792302b17dc77b456c2a89e937b39499d38'
        '3f0cc717f703fa4e50243a7053d3bc39fa7da79ae0abbfdbe48141a3a5279e9a'
        'c4fc556d9cd81ee8d0a9c354c28ded80dbea8f055e7385fe6d03a3e951c258bb'
        'b49b0f66311b498028f537e1544dde92b00cb19daee48a7763d094a45a193093'
        '9e82175ae890da2c6c0420cd4573d664825b0e65bfcbd13070084d0892b06b6d'
        '9a92e610206724f2d91ef51ffae9135761db6c589060d4935d430db90562a357'
        '14ecc4c11051a19a3d312c47feb8cf4cbb3e05493ede9dbe41e8e168d765c39b'
        '6741b67644934bfaa4c624193f0ec1187c6c5ae37d75fde672b4528b10a35829'
        )
sha256sums_x86_64=('048cb842970fb9a6df479ee1f489ecfc3c1dc2bc85c0cd129c514b2dea43561f')
sha256sums_i686=('917b0fb7f43520193629403885af99979646001965af0c1f836dec0524f9ab9d')

package() {

 	install -dm755 "$pkgdir/usr/share/applications/"
    install -d "$pkgdir"/opt/${_pkgbase}/
    install -Dm755 "$srcdir/linux-unpacked/${_pkgbase}" "$pkgdir/usr/bin/${_pkgbase}"
    mv "$srcdir/linux-unpacked/" "$srcdir/${_pkgbase}"
    cp -R "$srcdir/${_pkgbase}" $pkgdir/opt/
    install -Dm755 "$srcdir/${_pkgbase}.desktop" "$pkgdir/usr/share/applications/${_pkgbase}.desktop"
    for icon_size in 16 32 48 64 128 256 512; do
        icon_dir="$pkgdir/usr/share/icons/hicolor/${icon_size}x${icon_size}/apps"
        install -d "$icon_dir"
        install -m644 "$srcdir/${_pkgbase}${icon_size}.png" "$icon_dir/${_pkgbase}.png"
    done

}
