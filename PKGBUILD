# Maintainer: ResRipper <resripper at connective dot link>

# shellcheck disable=SC2034,SC2154,SC2148

pkgname='jhentai-bin'
_ver_main='8.0.16'
_ver_sub='334'
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
b2sums_x86_64=('7bb9776e1f76aa9258b8195ecb3b4f6cd3ea275895002007c35f11b5c304f3d008055ef9e884d5b738eb96999b0b5d3caf01d1a3c8a13ee6f4660d1cf709d935')

source_aarch64=("jhentai-${_ver_main}_${_ver_sub}.deb::${_release_url}-arm64.deb")
b2sums_aarch64=('14691fffa1611cfa11401caba21026403d02481c637ee77fa66cd96a5311e1166bc03f0f958c4f067d8ac8e85c1fe7ff21ca40c3788397ebca2125273635bfc9')


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