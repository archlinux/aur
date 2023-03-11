# Maintainer: Patrik Sundberg <patrik.sundberg@gmail.com>

pkgname=beeper
pkgver=3.45.18
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
sha256sums=('4f4c8b4174338dc0639207ed869fd91dc6b0f1fa11538b274b37502e2a500bb8')

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
