# Maintainer: Ada Joule <ada dot fulmina at gmail dot com>
pkgname=refind-dreary-git
pkgver=r8.cdbabad
pkgrel=1
pkgdesc="A gloomy rEFInd theme based on evanpurkhiser/rEFInd-minimal and lukechilds/refind-ambience"
arch=('any')
url="https://github.com/stairmast0r/refind-dreary"
license=('none')
depends=('refind-efi')
makedepends=('git')
source=('git+https://github.com/stairmast0r/refind-dreary.git')
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    REFIND_HOME="${pkgdir}/boot/efi/EFI/refind"
    RESOLUTION="highres"

    mkdir -p "${REFIND_HOME}/themes"
    cp -r "${srcdir}/${pkgname%-git}/$RESOLUTION" "${REFIND_HOME}/themes"
    mv "${REFIND_HOME}/themes/$RESOLUTION" "${REFIND_HOME}/themes/${pkgname%-git}"
    chmod -R 644 "${REFIND_HOME}/themes/${pkgname%-git}"

    echo 'Remember to add "include themes/refind-dreary/theme.conf" to your refind.conf file'
}
