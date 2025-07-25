# Maintainer: ResRipper <resripper@connective.link>

# shellcheck disable=SC2034,SC2154,SC2148

pkgname='jhentai-bin'
pkgver='v8.0.9'
_ver_main='8.0.9'
_ver_sub='296'
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

# source=("jhentai-${_ver_main}_${_ver_sub}.deb::https://github.com/jiangtian616/JHenTai/releases/download/v${_ver_main}+${_ver_sub}/JHenTai-${_ver_main}+${_ver_sub}-Linux-x64.deb")
source=("jhentai-${_ver_main}_${_ver_sub}.deb::https://github.com/jiangtian616/JHenTai/releases/download/v${_ver_main}/JHenTai-${_ver_main}+${_ver_sub}-Linux-x64.deb")
b2sums=('a5eaa7109ee527cf170363d3bab91e07d5082815b4bc93d6770e90d3ea09016a15b86553a5ee15762a0baff3ded0e004e5939d23417b88a52edb876f5de15838')

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