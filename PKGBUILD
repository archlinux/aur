# Maintainer: Ada Joule <ada dot fulmina at gmail dot com>
pkgname=refind-theme-dreary-git
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

esp="/boot"
resolution="highres"

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    refind_home="${pkgdir}/${esp}/EFI/refind"

    mkdir -p "${refind_home}/themes"
    cp -r "${srcdir}/${pkgname%-git}/$resolution" "${refind_home}/themes"
    mv "${refind_home}/themes/$resolution" "${refind_home}/themes/${pkgname%-git}"
    chmod -R 644 "${refind_home}/themes/${pkgname%-git}"

    echo 'Remember to add "include themes/refind-dreary/theme.conf" to your refind.conf file'
}
