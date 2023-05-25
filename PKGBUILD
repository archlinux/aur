# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Maintainer: FirstAirBender <noblechuk5[at]web[dot]de>
# Contributor: Bitts311 <oceanmail311@gmail.com>

_pkgname=Qogir-theme
_pkgver=2023-05-24
pkgname="qogir-gtk-theme"
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Qogir is a flat Design theme for GTK"
arch=('any')
url="https://github.com/vinceliuice/Qogir-theme"
license=('GPL3')
makedepends=('grep' 'sassc')
optdepends=(
	'gtk-engines: For GTK2 support'
	'gtk-engine-murrine: For GTK2 support'
    'kvantum-theme-qogir-git: Matching Kvantum theme'
    'qogir-icon-theme: Matching icon theme'
    'vimix-cursors: Matching cursor theme'
    'tela-icon-theme: Recommended icon theme'
)
backup=(etc/qogir-gtk-theme/options.txt)
install="${pkgname}.install"
options=('!strip')
source=(
    "$pkgname-$pkgver.tar.gz::https://github.com/vinceliuice/$_pkgname/archive/$_pkgver.tar.gz"
    "options.txt"
)
sha256sums=('e4c681f10cd9c9ff829f0e9c7b56f857120ec4fd5638203494db3a9b188b8796'
            'fabf821acfe0641fd233d4d7a42a536aedc369516de62f877e83a1070c73327e')

package() {
    INSTALL_OPTS="$(/usr/bin/grep \
        --extended-regexp \
        --max-count=1 \
        --line-regexp \
        --no-messages \
        --invert-match '^\s*$|#.+' \
        "/${backup[0]}" || echo -n '--theme all --tweaks image square round --icon arch')"

    install -Dm644 "$srcdir/options.txt" -t "$pkgdir/${backup[0]/%options.txt/}"
    install -dm755 "$pkgdir/usr/share/themes"
    cd "$_pkgname-$_pkgver"
    ./install.sh ${INSTALL_OPTS//--logo/--icon} --dest "$pkgdir/usr/share/themes"
    install -D ./install.sh -t "$pkgdir/usr/bin/${pkgname}/"
}
