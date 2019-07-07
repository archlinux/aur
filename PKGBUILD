# Maintainer: Jonathan Haylett <jonathan@haylett.dev>
_pkgbasename=i3-resurrect
pkgname=$_pkgbasename-git
pkgrel=1
pkgver=1.0.2
pkgdesc="A simple but flexible solution to saving and restoring i3 workspace layouts"
arch=('any')
url="http://github.com/JonnyHaystack/i3-resurrect"
license=('GPL')
depends=('python' 'i3-wm' 'perl-anyevent-i3' 'python-psutil')
source=(git+https://github.com/JonnyHaystack/i3-resurrect)
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgbasename"
    git tag -l --sort=-v:refname | head -n 1
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
    chmod +x "$pkgdir/usr/lib/$_python/site-packages/i3_resurrect.py"
}
