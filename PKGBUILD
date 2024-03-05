# Contributor: Michal Wojdyla < micwoj9292 at gmail dot com >
# Contributor: Kyle Keen <keenerd@gmail.com>

# transition pkgbuild while figuring out python2/python3 versions

pkgname=dreampie
pkgver=1.3.0.20220116
_commit=f615e9c63380d5987a820025fbb9dfe28ab96897
pkgrel=1
pkgdesc="A Python shell which is designed to be reliable and fun."
arch=('any')
url="https://github.com/noamraph/dreampie"
license=('GPL')
depends=('pygtksourceview2')
optdepends=('python2-matplotlib: for interactive plotting')
source=($pkgname-$pkgver.zip::https://github.com/noamraph/dreampie/archive/$_commit.zip)
md5sums=('ff8223d17115811f05661716c71f95ca')

build() {
    # git sha in srcdir
    cd "$srcdir/dreampie"-$_commit
    # build won't work with py3
    # but the later install is fine
    python2 setup.py build
}

package() {
    cd "$srcdir/dreampie"-$_commit
    #if which python3; then
    #    python3 setup.py install --prefix=/usr --root="$pkgdir"
    #    mv "$pkgdir/usr/bin/dreampie" "$pkgdir/usr/bin/dreampie-py3"
    #fi
    python2 setup.py install --prefix=/usr --root="$pkgdir"
    find "$pkgdir/" -name '*.pyc' -delete
    find "$pkgdir/" -type d -empty -delete
}

