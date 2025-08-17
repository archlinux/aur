# Maintainer: ResRipper <resripper@connective.link>

# shellcheck disable=SC2034,SC2154,SC2148

pkgname='jhentai-bin'
pkgver='v8.0.10'
_ver_main='8.0.10'
_ver_sub='297'
pkgdesc='A manga app for E-Hentai, supporting Android & iOS & Windows & MacOS & Linux.'
conflicts=('jhentai-git')

arch=('x86_64')
url='https://github.com/jiangtian616/JHenTai'
license=('Apache-2.0')
pkgrel='1'
options=(!debug)
depends=(
    'webkit2gtk-4.1'
)

source=("jhentai-${_ver_main}_${_ver_sub}.deb::https://github.com/jiangtian616/JHenTai/releases/download/v${_ver_main}/JHenTai-${_ver_main}+${_ver_sub}-Linux-x64.deb")
b2sums=('0b381badb2194717d3a1d735bc1eefaaae5624e0aadc09b46e3e8b9054ae3fb7ceef5760a1ee13ca0558c6f9fb44f46f4e1a13a7cf7b83ed65a169ae4e900235')

prepare() {
    tar -xf data.tar.zst
}

package() {
    # Install icons
    install -dm0755 "$pkgdir/usr/share/icons/hicolor/512x512/apps"
    cp -a "$srcdir/usr/share/icons/hicolor/512x512/apps/"* "$pkgdir/usr/share/icons/hicolor/512x512/apps/"
    chmod 644 "$pkgdir/usr/share/icons/hicolor/512x512/apps/top.jtmonster.jhentai.png"

    # Install desktop file
    install -dm0755 "$pkgdir/usr/share/applications"
    cp -a "$srcdir/usr/share/applications/"* "$pkgdir/usr/share/applications/"
    chmod 644 "$pkgdir/usr/share/applications/top.jtmonster.jhentai.desktop"
    
    # Install application
    install -dm0755 "$pkgdir/opt/jhentai"
    cp -a "$srcdir/opt/jhentai/"* "$pkgdir/opt/jhentai/"

    # Symlink binary to /usr/bin
    install -dm0755 "$pkgdir/usr/bin"
    ln -s /opt/jhentai/jhentai "$pkgdir/usr/bin/jhentai"
}