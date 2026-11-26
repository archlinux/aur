# Maintainer: leychan
pkgname=easy-music-bin
pkgver=0.1.7
pkgrel=1
pkgdesc='Music player for local files and HTTPS audio streams'
arch=('x86_64')
url='https://github.com/leychan/easy-music'
license=('MIT')
depends=('gtk3' 'libdbusmenu-glib' 'libsecret' 'mpv' 'xdg-desktop-portal')
optdepends=('xdg-desktop-portal-gtk: GTK file chooser backend'
            'org.freedesktop.secrets: desktop credential storage')
provides=("easy-music=${pkgver}")
conflicts=('easy-music')
options=('!strip' '!debug')
source=("${url}/releases/download/v${pkgver}/easy-music-${pkgver}-linux-${arch[0]}.tar.gz"
        'dev.easymusic.easy_music.desktop')
sha256sums=('6167345c656705cb5dd2f02ec6e1fa465649fdc7d1e00f598e296da6d07b1bcc'
            '4faf800cca809517eea9f854359d6969809f079ded92f889526b3e47a329e4ae')

package() {
    local appdir="$pkgdir/usr/lib/easy-music"
    install -d "$appdir" "$pkgdir/usr/bin"
    # Flutter 通过相对于可执行文件的路径加载 data/ 和 lib/。
    cp -a "$srcdir/bundle/." "$appdir/"
    ln -s ../lib/easy-music/easy_music "$pkgdir/usr/bin/easy-music"
    install -Dm644 "$srcdir/dev.easymusic.easy_music.desktop" \
        "$pkgdir/usr/share/applications/dev.easymusic.easy_music.desktop"

    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" \
        "$srcdir/LICENSE" "$srcdir/THIRD_PARTY_NOTICES"
}
