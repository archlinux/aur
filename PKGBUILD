# Maintainer: Simon Lemay <contact+archlinux@simonlemay.net>
# Contributor: Jim Pryor <profjim@jimpryor.net>

pkgname=chicken-numbers
_pkgname=numbers
pkgver=4.3
pkgrel=1
pkgdesc='Full numeric tower support'
arch=('i686' 'x86_64')
url='http://wiki.call-cc.org/eggref/4/numbers'
license=('BSD')
depends=('chicken')

build() {
    cd "$srcdir"
    if [[ ! -e "$_pkgname" ]]; then
        chicken-install -r "$_pkgname:$pkgver"
    fi
}

package() {
    cd "$srcdir/$_pkgname"
    chicken-install -p "$pkgdir/usr"

    # Modify setup-info file to use the typical install path.
    local pfx=$(echo "$pkgdir/usr$pkgdir" | sed -e 's/[]\/$*.^|[]/\\&/g')
    find "$pkgdir/usr" -name "${_pkgname}.setup-info" -exec sed -e "s/$pfx//g" -i {} \;
}
