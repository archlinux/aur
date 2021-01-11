# Maintainer: Jesse Nazario <jessenzr@gmail.com>
_pkgbasename=pipman
pkgname=$_pkgbasename-git
pkgrel=1
pkgver=1.1.r6.g27349f7
pkgdesc="Generate PKGBUILD from pip packages"
arch=('any')
url="http://github.com/sollidsnake/pipman"
license=('GPL')
depends=('python' 'python-pip' 'python-docopt' 'python-colorama')
makedepends=('git')
source=(git+https://github.com/sollidsnake/pipman)
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgbasename"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/$_pkgbasename"
    
    python setup.py bdist
}


package() {
    _pkg=$(ls "$srcdir/$_pkgbasename/dist/")
    tar -xC "$pkgdir/" -f "$srcdir/$_pkgbasename/dist/$_pkg"

    mkdir -p "$pkgdir/usr/bin"

    _python=$(ls "$pkgdir/usr/lib/")
    chmod +x "$pkgdir/usr/lib/$_python/site-packages/$_pkgbasename/$_pkgbasename.py"
    ln -s "/usr/lib/$_python/site-packages/$_pkgbasename/$_pkgbasename.py" \
       "$pkgdir/usr/bin/pipman"

}
