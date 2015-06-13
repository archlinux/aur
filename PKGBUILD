# Contributor: Kyle Keen <keenerd@gmail.com>

# transition pkgbuild while figuring out python2/python3 versions

pkgname=dreampie
pkgver=1.2.1
pkgrel=1
pkgdesc="A Python shell which is designed to be reliable and fun."
arch=('any')
url="http://dreampie.org"
license=('GPL')
depends=('pygtksourceview2')
optdepends=('python2-matplotlib: for interactive plotting')
source=($pkgname-$pkgver.tar.gz::https://github.com/noamraph/dreampie/tarball/$pkgver)
md5sums=('6d745ce46624ebce91e2aac67ebbfbf1')

build() {
    # git sha in srcdir
    cd "$srcdir/noamraph-dreampie"-*
    # build won't work with py3
    # but the later install is fine
    python2 setup.py build
}

package() {
    cd "$srcdir/noamraph-dreampie"-*
    #if which python3; then
    #    python3 setup.py install --prefix=/usr --root="$pkgdir"
    #    mv "$pkgdir/usr/bin/dreampie" "$pkgdir/usr/bin/dreampie-py3"
    #fi
    python2 setup.py install --prefix=/usr --root="$pkgdir"
    find "$pkgdir/" -name '*.pyc' -delete
    find "$pkgdir/" -type d -empty -delete
}

