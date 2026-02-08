# Maintainer: ResRipper <resripper at connective dot link>

# shellcheck disable=SC2034,SC2154,SC2148

pkgname='jhentai-bin'
_ver_main='8.0.11'
_ver_sub='306'
pkgver=v${_ver_main}_${_ver_sub}
pkgdesc='A manga app for E-Hentai, supporting Android & iOS & Windows & MacOS & Linux.'
conflicts=('jhentai-git')

arch=('x86_64' 'aarch64')
url='https://github.com/jiangtian616/JHenTai'
license=('Apache-2.0')
pkgrel='1'
options=(!debug)
depends=(
    'webkit2gtk-4.1'
    'zenity'
)

source_x86_64=("jhentai-${_ver_main}_${_ver_sub}.deb::${url}/releases/download/v${_ver_main}/JHenTai-${_ver_main}+${_ver_sub}-Linux-x64.deb")
sha256sums_x86_64=('b63f053ed9bb4b6f863f07b401cc026325b8012ad4660eff5ef80c6e26bec934')

source_aarch64=("jhentai-${_ver_main}_${_ver_sub}.deb::${url}/releases/download/v${_ver_main}/JHenTai-${_ver_main}+${_ver_sub}-Linux-arm64.deb")
sha256sums_aarch64=('c19cd8798ca072054f968d854f471a86988deee9ab25b21028e9bb92eadeeed5')


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