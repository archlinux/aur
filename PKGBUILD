# Maintainer: ssfdust <ssfdust@gmail.com>

pkgname=refind-theme-darkmini-git
_pkgname=darkmini
pkgver=r30.8ad13bd
pkgrel=1
pkgdesc="Dark, minimal theme for rEFInd and RefindPlus"
arch=('any')
url="https://github.com/LightAir/darkmini"
license=('MIT')
depends=('refind')
makedepends=('git')
optdepends=('refindplus-bin: use the theme with RefindPlus')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname}::git+${url}.git"
        "setup.sh")
sha256sums=('SKIP'
            '1494c697b76d06f4be52ece019858e30b19e729536f9a11623486d9221776726')
install="$pkgname.install"

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
    cd "$pkgname"
    local theme_dir="usr/share/refind/themes/${_pkgname}"

    install -Dm644 -t "${pkgdir}/${theme_dir}" theme.conf theme-mini.conf selection_big.png selection_small.png
    install -Dm644 -t "${pkgdir}/${theme_dir}/bg" bg/*.png
    install -Dm644 -t "${pkgdir}/${theme_dir}/icons" icons/*.png
    install -Dm755 -t "${pkgdir}/${theme_dir}" "${srcdir}/setup.sh"

    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
    install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" README.md
}
