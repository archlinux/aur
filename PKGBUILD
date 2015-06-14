# Maintainer: Simon Lemay <contact+archlinux@simonlemay.net>
# Contributor: Jim Pryor <profjim@jimpryor.net>

pkgname=chicken-readline
_pkgname=readline
pkgver=3.1.1
pkgrel=2
pkgdesc='An interface to the GNU readline library'
arch=('i686' 'x86_64')
url='http://wiki.call-cc.org/eggref/4/readline'
license=('GPL')
depends=('chicken' 'readline')

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
