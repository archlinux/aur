# Maintainer: Faerbit <faerbit at gmail dot com>

pkgname=grade_change_emailer-git
_pkgname=${pkgname%-git}
pkgver=0.1.1
pkgrel=1
pkgdesc="Checks for changes in your grades at the FH Aachen"
arch=('any')
url="https://github.com/Faerbit/grade_change_emailer"
license=('MIT')
depends=('python-setuptools' 'python-beautifulsoup4' 'python-requests' 'python-appdirs')
source=("git+https://github.com/Faerbit/grade_change_emailer.git")
md5sums=('SKIP')
install="${pkgname}.install"

pkgver() {
    cd "$srcdir/$_pkgname"
    echo $(git describe | sed 's/-/./g' | sed 's/v//g')
}

package() {
    cd "$srcdir/$_pkgname"

    python3 setup.py install --root="$pkgdir/" --optimize=1

    install -D -m644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -D -m644 "${_pkgname}/example.ini" "$pkgdir/etc/${_pkgname}.ini.skel"
}
