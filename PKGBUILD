# Maintainer: Jonathan Haylett <jonathan@haylett.dev>
_pkgbasename=i3-resurrect
pkgname=$_pkgbasename-git
pkgver=1.4.5.r0.g85a5e76
pkgrel=1
pkgdesc='A simple but flexible solution to saving and restoring i3 workspace layouts'
arch=('any')
url='http://github.com/JonnyHaystack/i3-resurrect'
license=('GPL')
depends=('python' 'python-psutil' 'python-i3ipc' 'python-click' 'python-natsort'
         'xorg-xprop' 'xdotool')
makedepends=('git' 'python-setuptools')
optdepends=('i3-wm')
provides=('i3-resurrect')
conflicts=('i3-resurrect')
source=(git+https://github.com/JonnyHaystack/i3-resurrect)
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
}
