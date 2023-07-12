# Maintainer: Patrik Sundberg <patrik.sundberg@gmail.com>

pkgname=beeper
pkgver=3.63.16
pkgrel=1
pkgdesc="all your chats in one app"
arch=('x86_64')
url="https://beeper.com/"
license=('custom')
depends=('zlib' 'hicolor-icon-theme')
makedepends=('p7zip')
noextract=("$pkgname-$pkgver.AppImage")
options=('!strip')

source=("$pkgname-$pkgver.AppImage::https://download.beeper.com/linux/appImage/x64")
sha256sums=('7cb1f32e170c5cc88b40c93146bf81e2a2b98b930ece0cfb2c92d16f946da050')

prepare() {
    cd "${srcdir}"
    7z x "${srcdir}/$pkgname-$pkgver.AppImage" $pkgname.desktop usr/share/icons/hicolor/512x512/apps/$pkgname.png LICENSE.electron.txt LICENSES.chromium.html
    sed -i "s/Exec=AppRun \-\-no\-sandbox/Exec=\/usr\/bin\/$pkgname/" $pkgname.desktop
}

package() {
    cd "${srcdir}"
    install -Dm755 "$pkgname-$pkgver.AppImage"                         "${pkgdir}/opt/$pkgname/$pkgname-$pkgver.AppImage"
    install -Dm644 "$pkgname.desktop"                                  "${pkgdir}/usr/share/applications/$pkgname.desktop"
    install -Dm644 "usr/share/icons/hicolor/512x512/apps/$pkgname.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/$pkgname.png"
    mkdir "${pkgdir}/usr/bin"
    ln -s "/opt/$pkgname/$pkgname-$pkgver.AppImage"                    "${pkgdir}/usr/bin/$pkgname"
    install -Dm644 LICENSE.electron.txt                                "$pkgdir/usr/share/licenses/$pkgname/LICENSE.electron.txt"
    install -Dm644 LICENSES.chromium.html                              "$pkgdir/usr/share/licenses/$pkgname/LICENSES.chromium.html"
}
