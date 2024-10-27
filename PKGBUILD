# Maintainer: ResRipper <resripper@connective.link>

pkgname='jhentai-bin'
pkgver='v8.0.5_266'
pkgdesc='A manga app for E-Hentai, supporting Android & iOS & Windows & MacOS & Linux.'

arch=('x86_64')
url='https://github.com/jiangtian616/JHenTai'
license=('Apache-2.0')
pkgrel='1'
depends=(
    'webkit2gtk-4.1'
)

source=("jhentai-${pkgver}.deb::https://github.com/jiangtian616/JHenTai/releases/download/v8.0.5%2B266/JHenTai-8.0.5+266-Linux-amd64.deb")
sha512sums=('e509ce4dbbff8487c38979d36a695c5defb2b511930f2e8e3b5f3efecd38ff4f01c821e410b0b478b548046068a3e45041360813560478feb702301354377d6f')

prepare() {
    tar -xf data.tar.zst
}

package() {
    # Install desktop file 
    install -dm0755 "$pkgdir/usr/share/icons/hicolor/512x512/apps"
    cp -a "$srcdir/usr/share/icons/hicolor/512x512/apps/"* "$pkgdir/usr/share/icons/hicolor/512x512/apps/"

    # Install icon
    install -dm0755 "$pkgdir/usr/share/applications"
    cp -a "$srcdir/usr/share/applications/"* "$pkgdir/usr/share/applications/"
    
    # Install application
    install -dm0755 "$pkgdir/opt/jhentai"
    cp -a "$srcdir/opt/jhentai/"* "$pkgdir/opt/jhentai/"

    # Symlink binary to /usr/bin
    install -dm0755 "$pkgdir/usr/bin"
    ln -s /opt/jhentai/jhentai "$pkgdir/usr/bin/jhentai"
}