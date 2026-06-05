# Maintainer: ResRipper <resripper at connective dot link>

# shellcheck disable=SC2034,SC2154,SC2148

pkgname='jhentai-bin'
_ver_main='8.0.13'
_ver_sub='312'
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
b2sums_x86_64=('47bfcf50d9c84e7389f5b9b3d39491a2f469af906b6cd2d75586e9e11c635ca46e291176f0cb9bec326a9abd52f86910c0bd30ca4cc3aab09ad7b53a84b456c5')

source_aarch64=("jhentai-${_ver_main}_${_ver_sub}.deb::${url}/releases/download/v${_ver_main}+${_ver_sub}/JHenTai-${_ver_main}+${_ver_sub}-Linux-arm64.deb")
b2sums_aarch64=('ea1e099be82ec254560cd9ca53785622170ce3752b843619353307dde83c3781b819bf520b4f35faf17361d4a26c9aad5821b412149c3a548b88b37bc22417a8')


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