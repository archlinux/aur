# Maintainer: ssfdust <ssfdust@gmail.com>

pkgname=refind-theme-darkmini-git
_pkgname=darkmini
pkgver=r20.0bef03e
pkgrel=1
pkgdesc="Dark theme for rEFInd"
arch=('any')
url="https://github.com/dheishman/refind-dreary"
license=('none')
depends=('refind')
makedepends=('git')
source=("${pkgname}::git+https://github.com/LightAir/darkmini.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    efidir=$(find /boot -type d -name "EFI")

    mkdir -p "${pkgdir}/${efidir}/refind/themes"
    cp -r "${srcdir}/${pkgname}/" "${pkgdir}/${efidir}/refind/themes/${_pkgname}"

    echo 'Remember to add "include themes/'${_pkgname}'/theme.conf" to your refind.conf file'
}
