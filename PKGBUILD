# Maintainer: ResRipper <resripper at connective dot link>

# shellcheck disable=SC2034,SC2154,SC2148

pkgname='jhentai-bin'
_ver_main='8.0.16'
_ver_sub='333'
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

# _release_url="${url}/releases/download/v${_ver_main}+${_ver_sub}/JHenTai-${_ver_main}+${_ver_sub}-Linux"
_release_url="${url}/releases/download/v${_ver_main}/JHenTai-${_ver_main}+${_ver_sub}-Linux"

source_x86_64=("jhentai-${_ver_main}_${_ver_sub}.deb::${_release_url}-x64.deb")
b2sums_x86_64=('600b269cc7f8dad98ba344968e57be8d7deb054885570131d9fd21eca515d1737f3ad22808d05d42fb88a3ca5b87a92a0d65f0093b3d837069aa7287232a20a5')

source_aarch64=("jhentai-${_ver_main}_${_ver_sub}.deb::${_release_url}-arm64.deb")
b2sums_aarch64=('29811984e2dceea6498e26c0ecff63ca1ddc4a1af350645a30a33ab77a84b309db292250a4b2d5ce8e750ae054702a381e0111a1cf43e5078703f3a8e41f50ad')


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