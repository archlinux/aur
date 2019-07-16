# Maintainer: Jonathan Haylett <jonathan@haylett.dev>
_pkgbasename=i3-resurrect
pkgname=$_pkgbasename-git
pkgrel=2
pkgver=1.1.0
pkgdesc="A simple but flexible solution to saving and restoring i3 workspace layouts"
arch=('any')
url="http://github.com/JonnyHaystack/i3-resurrect"
license=('GPL')
depends=('git' 'python' 'i3-wm' 'python-psutil' 'i3ipc-python-git' 'wmctrl' 'wmctrl-python3-git' 'python-click' 'python-enum-compat' 'python-setuptools')
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
