# Maintainer: ResRipper <resripper at connective dot link>

# shellcheck disable=SC2034,SC2154,SC2148

pkgname='jhentai-bin'
_ver_main='8.0.14'
_ver_sub='328'
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

_release_url="${url}/releases/download/v${_ver_main}+${_ver_sub}/JHenTai-${_ver_main}+${_ver_sub}-Linux"
# _release_url="${url}/releases/download/v${_ver_main}/JHenTai-${_ver_main}+${_ver_sub}-Linux"

source_x86_64=("jhentai-${_ver_main}_${_ver_sub}.deb::${_release_url}-x64.deb")
b2sums_x86_64=('74e6101e323dff69804544da7621d06cc4122f42d2a1e6407d83d90db4cf64b74b3a5637ca3bf213d579bdaec93b274a31e738a909bf40a3e9d8b0320f800640')

source_aarch64=("jhentai-${_ver_main}_${_ver_sub}.deb::${_release_url}-arm64.deb")
b2sums_aarch64=('908e65569e0e0386fbd39987c8e41382719b0a60273f54df0e772ac2706dc12bc5fb7a64ddbf714f898ca653f8ebb170c304959dc85dbb1b9f96bd1474c39714')


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