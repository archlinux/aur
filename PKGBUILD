

# Maintainer: Steven Tucker <tuxta2@gmail.com>
pkgname='myquerytutor'
pkgver=r95.61f6917
pkgrel=1
pkgdesc="A personal tutor to teach you Structured Query Language."
arch=('any')
url="https://myquerytutor.com"
license=('GPL')
groups=()
depends=('python3' 'python-pyqt5' 'python-pyqtwebengine' 'python-beautifulsoup4' 'python-requests' 'python-setuptools' 'desktop-file-utils')
makedepends=('git')
source=('myquerytutor::git+http://gitlab.com/tuxta/myquerytutor.git')
noextract=()
md5sums=('SKIP')

pkgver() {
        cd "$pkgname"
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
        cd "$pkgname"
        python setup.py build
}

package() {
    cd "$pkgname"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
    install -Dm644 $srcdir/myquerytutor/src/myquerytutor/myquerytutor.desktop "$pkgdir"/usr/share/applications/myquerytutor.desktop
    install -Dm644 $srcdir/myquerytutor/src/myquerytutor/mqt.png "$pkgdir"/usr/share/pixmaps/mqt.png
}


