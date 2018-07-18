_pkgname=pakku-gui
pkgname=$_pkgname-git
pkgver=0.1.4
pkgrel=1
pkgdesc="GTK frontend for pakku"
arch=("any") # If pakku and python can be installed, this too
url="https://gitlab.com/mrvik/$_pkgname"
license=("GPL2")
depends=("python" "python-gobject" "gtk3" "pakku")
makedepends=("git")
source=("git+https://gitlab.com/mrvik/$_pkgname.git")
provides=($_pkgname)
conflicts=($_pkgname)
sha256sums=('SKIP')
pkgver(){
    cd $_pkgname
    git describe --tags|sed 's+-+.+g'
}

package(){
    _libdir=$pkgdir/usr/lib/$_pkgname
    _applications=$pkgdir/usr/share/applications
    cd "$srcdir/$_pkgname"
    mkdir -p "$_libdir" "$_applications" "$pkgdir/usr/bin" "$pkgdir/etc"
    cp *.py "$_libdir"
    cp "$_pkgname.desktop" "$_applications"
    cp "$_pkgname.conf" "$pkgdir/etc"
    chmod +x "$_libdir/main.py"
    ln -s "/usr/lib/$_pkgname/main.py" "$pkgdir/usr/bin/$_pkgname"
}
