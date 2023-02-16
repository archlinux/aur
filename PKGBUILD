# AUR Maintainer: otaj <jasek.ota@gmail.com>
# PKGBUILD inspiration from fira-code

pkgbase=sparks-fonts
pkgname=('ttf-sparks-fonts' 'woff-sparks-fonts' 'woff2-sparks-fonts' 'eot-sparks-fonts' 'otf-sparks-fonts')
pkgver=2.0
pkgrel=1
pkgdesc="A typeface for creating sparklines in text"
arch=('any')
url='https://github.com/aftertheflood/sparks'
license=('custom:OFL')
depends=()
source=("$pkgbase-$pkgver.zip::$url/releases/download/v${pkgver}/Sparks-font-complete.zip"
        "LICENSE::https://raw.githubusercontent.com/aftertheflood/sparks/master/OFL.txt")
sha512sums=('e937f16d0dae0e2758fe7bfb40d4aa9ffc3aa9d47983278baaa00f1cd3f74ebaead1149fc8f7dbc4c33142f82dd091e0cfa3b01f4c7770fffb4d1f9fb8fef0dd'
            'ebb9c3dbb42626cb8b92f8426daea12f90424ac4a798a310aace5f18feb5c756ae216e07a5299ed78a82574bd4ff17e8d2ef0a5197e48452e352601b8f2fcfc3')

function _package {
    local _pkgname=$1
    local ext="${_pkgname%%-*}"
    cd "$srcdir/Sparks"
    local fonts=(Sparks*."$ext")
    local installdir="${ext^^}"

    # Prepare destination directory
    install -dm755 "$pkgdir/usr/share/fonts/$installdir"

    # Install fonts
    local font
    for font in "${fonts[@]}"; do
        install -m644 "$font" "$pkgdir/usr/share/fonts/$installdir"
    done

    # Install LICENSE
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}

for _pkgname in "${pkgname[@]}"; do
    eval "function package_$_pkgname() { _package $_pkgname; }"
done
