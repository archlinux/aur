# Maintainer: Firegem <mrfiregem [at] protonmail [dot] ch>
# Contributor: KafCoppelia <k740677208@gmail.com>

pkgname=catppuccin-fcitx5-git
pkgver=r20.393845c
pkgrel=2
pkgdesc="Soothing pastel theme for Fcitx5"
arch=('any')
url="https://github.com/catppuccin/fcitx5"
license=('MIT')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname}::git+https://github.com/catppuccin/fcitx5.git")
sha256sums=('SKIP')


pkgver() {
    cd ${srcdir}/${pkgname}
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


package() {
    cd ${srcdir}/${pkgname}
    install -d ${pkgdir}/usr/share/fcitx5/themes/
    ./enable-rounded.sh
    cp ./*-rounded.sh ${pkgdir}/usr/share/fcitx5/
    sed -i "s/cd src\//cd themes\//" ${pkgdir}/usr/share/fcitx5/*-rounded.sh
    cp -r ./src/* ${pkgdir}/usr/share/fcitx5/themes/
    install -Dm 644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
