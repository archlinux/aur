# Maintainer: Randall Winkhart <idgr at tutanota dot com>

pkgname=nova-music-git
pkgver=0.1.0_518cb07
pkgrel=2
pkgdesc="A music player written in the libcosmic toolkit"
arch=('any')
options=('!emptydirs')
url="https://github.com/lunarsrl/NovaMusic"
license=('GPL-2.0-or-later')
makedepends=(just rust) # hah, "just rust"...
depends=()

source=('git+https://github.com/lunarsrl/NovaMusic.git#branch=main')
sha512sums=(SKIP)

build() {
    cd "$srcdir"/NovaMusic
    just
}

package() {
    cd "$srcdir"/NovaMusic
    mkdir -p "$pkgdir"/usr/bin/
    mkdir -p "$pkgdir"/usr/share/applications
    install ./target/release/nova-music "$pkgdir"/usr/bin/
    echo '[Desktop Entry]
Name=Nova Music
GenericName=Music Player
Comment=A Cosmic-native music player
Exec=/usr/bin/nova-music %U
Terminal=false
Type=Application
Icon=nova-music
Categories=Audio;
StartupNotify=false' > ${pkgdir}/usr/share/applications/nova-music.desktop
}
