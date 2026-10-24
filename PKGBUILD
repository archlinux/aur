# Maintainer: ResRipper <resripper at connective dot link>

# shellcheck disable=SC2034,SC2154,SC2148

pkgname='jhentai-bin'
_ver_main='8.0.18'
_ver_sub='341'
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
b2sums_x86_64=('998b07315159a49802b02b1f201acfddc60b10aebf8d1109136a5c4fd44e58320bf57a6ca8f3b99ecdc3e68ff231a3fad146b09bd05cf6d8b0cd59c85e6d7da0')

source_aarch64=("jhentai-${_ver_main}_${_ver_sub}.deb::${_release_url}-arm64.deb")
b2sums_aarch64=('ee9db2ec02e2a9e51ec05eb610efb9d530d6bfd534f7a91a767969bc77f741db2cce684e6572e2fc385476c9d9cf3f0275c4502a36ffdccfe3bf012fbdb396af')


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
