# Maintainer: ResRipper <resripper at connective dot link>

# shellcheck disable=SC2034,SC2154,SC2148

pkgname='jhentai-bin'
_ver_main='8.0.14'
_ver_sub='323'
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

source_x86_64=("jhentai-${_ver_main}_${_ver_sub}.deb::${url}/releases/download/v${_ver_main}+${_ver_sub}/JHenTai-${_ver_main}+${_ver_sub}-Linux-x64.deb")
# source_x86_64=("jhentai-${_ver_main}_${_ver_sub}.deb::${url}/releases/download/v${_ver_main}/JHenTai-${_ver_main}+${_ver_sub}-Linux-x64.deb")
b2sums_x86_64=('e16cc95489916dc6c1d37e757855a214e797b53515df0b491284c16a85065681ee94fcd5bce284bb095a7a21bf19ba64e38108e03ebe261743f0e78b10abd142')

source_aarch64=("jhentai-${_ver_main}_${_ver_sub}.deb::${url}/releases/download/v${_ver_main}+${_ver_sub}/JHenTai-${_ver_main}+${_ver_sub}-Linux-arm64.deb")
# source_aarch64=("jhentai-${_ver_main}_${_ver_sub}.deb::${url}/releases/download/v${_ver_main}/JHenTai-${_ver_main}+${_ver_sub}-Linux-arm64.deb")
b2sums_aarch64=('3bb5877c9c980743a44701fecb3a2eb81aeca5877b7df8ce87873392bbe24f6e72397c07d3ecba790e62c64fbe1535e149a1aaf9b880712721eaefc75e11a692')


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