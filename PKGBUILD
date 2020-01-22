# Maintainer: Étienne Deparis <etienne@depar.is>
pkgname=chwall-git
_gitname=chwall
pkgver=0.5.0r266.53be367
pkgrel=1
pkgdesc="A tiny wallpaper changer, written in python"
arch=("any")
url="https://git.deparis.io/chwall/about/"
license=("WTFPL")
depends=("gtk3" "python-cssselect" "python-gobject" "python-lxml"
         "python-pillow" "python-requests" "python-xdg" "python-yaml")
makedepends=("python-setuptools" "imagemagick" "git")
conflicts=("chwall")
source=("git+https://git.deparis.io/${_gitname}")
md5sums=("SKIP")

pkgver() {
    cd "$srcdir/${_gitname}"
    curver=$(python setup.py --version)
    printf "%sr%s.%s" "$curver" "$(git rev-list --count HEAD)" \
           "$(git rev-parse --short HEAD)"
}

package() {
    cd "$srcdir/${_gitname}"
    make dist DESTDIR=$pkgdir
}
