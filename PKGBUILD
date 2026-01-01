# Maintainer: ResRipper <resripper@connective.link>

# shellcheck disable=SC2034,SC2154,SC2148

pkgname='jhentai-bin'
_ver_main='8.0.10'
_ver_sub='303'
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

source_x86_64=("jhentai-${_ver_main}_${_ver_sub}.deb::https://github.com/jiangtian616/JHenTai/releases/download/v${_ver_main}+${_ver_sub}/JHenTai-${_ver_main}+${_ver_sub}-Linux-x64.deb")
sha256sums_x86_64=('7501ccf5c5cd7e5107953408ca8eded3371ecf529cedc94e00b4c5e1d014dddb')

source_aarch64=("jhentai-${_ver_main}_${_ver_sub}.deb::https://github.com/jiangtian616/JHenTai/releases/download/v${_ver_main}+${_ver_sub}/JHenTai-${_ver_main}+${_ver_sub}-Linux-arm64.deb")
sha256sums_aarch64=('9a2203219e0a4ba10473ee0ae4157046eb143e37bd47ecb95b25454cb10fbe4d')


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