# Maintainer: Rain Xelelo <rxelelo@outlook.com>

pkgname=cactus-client
pkgver=1.14
pkgrel=1
# allow testing locally a release candidate using pkgver like '19.3rc3'
_version=${pkgver/rc/-rc}
pkgdesc="A DDRaceNetowrk modification adding new feauters"
arch=('x86_64')
url="https://cactuss.top//"
license=()
depends=('freetype2' 'opusfile' 'curl' 'glew' 'wavpack' 'ffmpeg' 'libnotify' 'miniupnpc' 'sqlite' 'mariadb-libs' 'vulkan-icd-loader')
checkdepends=('gmock')
optdepends=('ddnet-maps-git: All the maps used on the official DDNet Servers.'
            'discord-game-sdk: Enable rich presence in Discord desktop client.')
backup=('usr/share/ddnet/data/autoexec_server.cfg')

source=("https://dw.cactuss.top/$_version/Cactus-$_version-public-linux_x86_64.tar.xz"
        "ddnet-server.service" "ddnet-sysusers.conf" "ddnet-tmpfiles.conf" "run.sh" "cactus-client.png" "cactus-client.desktop")
sha256sums=('88b44bb74ff954ee3ac3701257162593dc73ec9a849a7943ca0a84aec1dac7b5'
            '9377a9d7c87abae166c8fa98cd79a61c74482f80f80bc930ae043349e9a84965'
            '70034f237270b38bf312238a26cfd322e212ca5714bfea4ae91e80c639ce8738'
            '043452f4de3c86d903973009bb3e59b3492a6669b86d0b1410e59a1476a87369'
            '41197a3ac7a0dac3ccace297fc66d197fdbfb62880e1341acaf55ac8cdaa151b'
            '8508552983950820bd5c8829bd43e714a4a958a084211dc1a8be6619f8d0b742'
            '5d00adbecbd0b5c6c62a011e5b44e12cb30e683cb8238eae8d07975e8048da89')

prepare() {
    mkdir -p cactus
    bsdtar -xf "Cactus-$_version-public-linux_x86_64.tar.xz" -C cactus
    chmod +x cactus/Cactus-$_version-public-linux_x86_64/DDNet
    chmod +x $srcdir/run.sh
}


package() {
    install -dm0755 "$pkgdir/opt"
    cp -a cactus "$pkgdir/opt/$pkgname"
    install -vDm644 "$srcdir/run.sh" "$pkgdir/usr/bin/cactus-client"
    chmod +x $pkgdir/usr/bin/cactus-client
    install -vDm644 "$srcdir/ddnet-server.service" "$pkgdir/usr/lib/systemd/system/ddnet-server.service"
    install -vDm644 "$srcdir/ddnet-sysusers.conf"  "$pkgdir/usr/lib/sysusers.d/ddnet.conf"
    install -vDm644 "$srcdir/ddnet-tmpfiles.conf"  "$pkgdir/usr/lib/tmpfiles.d/ddnet.conf"
    install -vDm644 "$srcdir/cactus-client.desktop"  "$pkgdir/usr/share/applications/cactus-client.desktop"
    install -Dm0644 "$srcdir/cactus-client.png" "$pkgdir/opt/cactus-client/cactus-client.png"
}
