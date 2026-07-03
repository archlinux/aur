# Maintainer: ResRipper <resripper at connective dot link>

# shellcheck disable=SC2034,SC2154,SC2148

pkgname='jhentai-bin'
_ver_main='8.0.14'
_ver_sub='317'
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

# source_x86_64=("jhentai-${_ver_main}_${_ver_sub}.deb::${url}/releases/download/v${_ver_main}+${_ver_sub}/JHenTai-${_ver_main}+${_ver_sub}-Linux-x64.deb")
source_x86_64=("jhentai-${_ver_main}_${_ver_sub}.deb::${url}/releases/download/v${_ver_main}/JHenTai-${_ver_main}+${_ver_sub}-Linux-x64.deb")
b2sums_x86_64=('b1fdb16916889b6dc771c8077cd2a494c2c4e8feafeeebae54403a59acaf40e37702adf2fa7c70e5189397dbd7cc9d1cffef3c14d672c28ce47733c8ac56b9e8')

# source_aarch64=("jhentai-${_ver_main}_${_ver_sub}.deb::${url}/releases/download/v${_ver_main}+${_ver_sub}/JHenTai-${_ver_main}+${_ver_sub}-Linux-arm64.deb")
source_aarch64=("jhentai-${_ver_main}_${_ver_sub}.deb::${url}/releases/download/v${_ver_main}/JHenTai-${_ver_main}+${_ver_sub}-Linux-arm64.deb")
b2sums_aarch64=('94e48d71e3c63306f140f386d217e73dd6fbba947856d528b41c4563da388b8eab1c34d22ec7f4641aaa1909ff216e1daac6aa4565a6b5ced0a9c889a0523368')


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