# Maintainer: Tomas S. <me+aur at wereii.cz>

pkgname=pyfa-appimage
pkgver=2.60.0
pkgrel=1
_distname="Pyfa-${pkgver}"
pkgdesc="EVE Online Fitting Assistant"
arch=('any')
url="https://github.com/pyfa-org/Pyfa"
license=('GPL3')
conflicts=('pyfa')
depends=('fuse2' 'wxwidgets-gtk3' 'webkit2gtk')
# wxwidgets-gtk3 is not directly required, but too many dependencies of it are 
# due to the dynamic nature of the appimage, so we take this short-cut
options=(!strip)
source=(${_distname}.AppImage::https://github.com/pyfa-org/Pyfa/releases/download/v$pkgver/pyfa-v$pkgver-linux.AppImage
        pyfa.desktop)

sha256sums=('6cf227958b6c1ed2e4dc0905f017fd0a0254017ef346f75beaa3b5d4ccc5dde1'
            '9a82fbdff39e873015a08ef6288cbc55695407952d366a5994c63acc536b13ba')

package() {
    install -Dm755 "$srcdir/${_distname}.AppImage" "$pkgdir/opt/pyfa/${_distname}.AppImage"
    install -Dm644 "$srcdir/pyfa.desktop" "$pkgdir/usr/share/applications/pyfa.desktop"

    mkdir -p "$pkgdir/usr/bin/"
    cd "$pkgdir/usr/bin/"
    ln -fs /opt/pyfa/${_distname}.AppImage pyfa
}

