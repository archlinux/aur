# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Maintainer: FirstAirBender <noblechuk5[at]web[dot]de>
# Contributor: Bitts311 <oceanmail311@gmail.com>

pkgname=qogir-gtk-theme
_pkgname=Qogir-theme
_pkgver=2022-05-29
pkgver=${_pkgver//-/.}
pkgrel=5
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
sha256sums=('a4a507e3e34e88428b61e4939d50e7568003b5ede631c707042b1532903fec99'
            '1d38ce625d24f5ff6f083783802a2f86c5f6a8e80155b5b65e3c602359d262dd')

build() {
    INSTALL_OPTS="$(/usr/bin/grep \
        --extended-regexp \
        --max-count=1 \
        --line-regexp \
        --no-messages \
        --invert-match '^\s*$|#.+' \
        /etc/qogir-gtk-theme/options.txt || echo -n '--theme all --tweaks image square round --logo arch')"
    export INSTALL_OPTS
}

package() {
    cd "$_pkgname-$_pkgver" || return 1
    install -dm755 "$pkgdir/usr/share/themes"
    install -D --mode=644 "$srcdir/options.txt" --target-directory="$pkgdir/etc/qogir-gtk-theme/"
    ./install.sh ${INSTALL_OPTS} --dest "$pkgdir/usr/share/themes"
}
