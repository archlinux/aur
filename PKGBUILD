# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Maintainer: FirstAirBender <noblechuk5[at]web[dot]de>
# Contributor: Bitts311 <oceanmail311@gmail.com>

pkgname=qogir-gtk-theme
_pkgname=Qogir-theme
_pkgver=2022-11-09
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Qogir is a flat Design theme for GTK"
arch=('any')
url="https://github.com/vinceliuice/Qogir-theme"
license=('GPL3')
depends=('gtk3' 'gtk-engine-murrine' 'gtk-engines')
makedepends=('grep' 'sassc')
optdepends=('kvantum-theme-qogir-git: Matching Kvantum theme'
    'qogir-icon-theme: Matching icon theme'
    'vimix-cursors: Matching cursor theme'
    'tela-icon-theme: Recommended icon theme')
backup=(etc/qogir-gtk-theme/options.txt)
options=('!strip')
source=(
    "$pkgname-$pkgver.tar.gz::https://github.com/vinceliuice/$_pkgname/archive/$_pkgver.tar.gz"
    "options.txt"
)
sha256sums=('0075412e14ca9cc012b7eb7fc302524d82af8e872e2f139cddb4ec80201ebe41'
            'fabf821acfe0641fd233d4d7a42a536aedc369516de62f877e83a1070c73327e')

build() {
    INSTALL_OPTS="$(/usr/bin/grep \
        --extended-regexp \
        --max-count=1 \
        --line-regexp \
        --no-messages \
        --invert-match '^\s*$|#.+' \
        /etc/qogir-gtk-theme/options.txt || echo -n '--theme all --tweaks image square round --icon arch')"
    export INSTALL_OPTS
}

package() {
    cd "$_pkgname-$_pkgver" || return 1
    install -dm755 "$pkgdir/usr/share/themes"
    install -D --mode=644 "$srcdir/options.txt" --target-directory="$pkgdir/etc/qogir-gtk-theme/"
    ./install.sh ${INSTALL_OPTS//--logo/--icon} --dest "$pkgdir/usr/share/themes"
}
