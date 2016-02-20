# Maintainer: David Trail <napalm10@gmail.com>

pkgname="tea-git"
pkgver=57
pkgrel=1
pkgdesc="Tea Daemon, alerts you when your tea is ready."
arch=('i686' 'x86_64')
url="https://github.com/x89/Tea"
license=('BSD 2-clause + tea ^ beer')
optdepends=("mplayer: Lightweight, non-gui"
            "mpv: Fancy new GUI-less-ish player"
            "vlc:  All strings attached uber music player")
requires=('git')
provides=('tea' 'tead')
md5sums=('SKIP')
source=('git+https://github.com/x89/Tea.git')

build() {
    cd "$srcdir/Tea"
    sed -i 's/tea.flac/\/usr\/share\/tea\/tea.flac/' tea.sh
    sed -i 's/tea.mp3/\/usr\/share\/tea\/tea.mp3/' tea.sh
}

package() {
    cd "$srcdir/Tea"
    install -D -m755 "${srcdir}/Tea/tea.sh" "${pkgdir}/usr/bin/tea"
    install -D -m644 "${srcdir}/Tea/tea.flac" "${pkgdir}/usr/share/tea/tea.flac"
    install -D -m644 "${srcdir}/Tea/tea.mp3" "${pkgdir}/usr/share/tea/tea.mp3"
    install -D -m644 "${srcdir}/Tea/LICENSE" "${pkgdir}/usr/share/licenses/tea/LICENSE"
    install -D -m644 "${srcdir}/Tea/service/tead.service" "${pkgdir}/usr/lib/systemd/system/tead.service"
    install -D -m644 "${srcdir}/Tea/service/tead.socket" "${pkgdir}/usr/lib/systemd/system/tead.socket"
}

