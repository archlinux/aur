# Maintainer: Stefan Schmidt <thrimbor gmail com>

pkgname=xboxeepromeditor-git
pkgver=r7.e94ed9a
pkgrel=1
pkgdesc="Original Xbox EEPROM Editor"
arch=('i686' 'x86_64')
url="https://github.com/Ernegien/XboxEepromEditor"
license=('GPL2')
depends=('mono')
makedepends=('git')
source=(XboxEepromEditor::"git+https://github.com/Ernegien/XboxEepromEditor.git"
        xboxeepromeditor)
sha256sums=('SKIP'
            'SKIP')

pkgver() {
    cd "${srcdir}"/XboxEepromEditor
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
prepare() {
    cd "${srcdir}"/XboxEepromEditor/XboxEepromEditor
}

build() {
    cd "${srcdir}/XboxEepromEditor/XboxEepromEditor"
    xbuild XboxEepromEditor.csproj
#    chmod +x ./bin/Debug/XboxEepromEditor.exe
}

package() {
    install -dm755 "$pkgdir"/usr/bin
    install -dm755 "$pkgdir"/usr/share/xboxeepromeditor
    install -Dm755 "$srcdir"/xboxeepromeditor "$pkgdir"/usr/bin
    install -Dm755 "$srcdir"/XboxEepromEditor/XboxEepromEditor/bin/Debug/XboxEepromEditor.exe "$pkgdir"/usr/share/xboxeepromeditor/XboxEepromEditor.exe
}
