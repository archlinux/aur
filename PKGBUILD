# Maintainer: Jason Edson <jaysonedson@gmail.com>

_pkgname=meld
pkgname=$_pkgname-git
pkgver=3.20.0.485.gff5916e7
pkgrel=1
_realver=3.21.0
pkgdesc='Visual diff and merge tool'
arch=('any')
url='http://meldmerge.org/'
license=('GPL')
depends=('python>=3.3'
         'gtk3>=3.20'
         'glib2>=2.48'
         'python-gobject>=3.30'
         'pygobject-devel>=3.30'
         'gtksourceview4>=4.0.0'
         'python-cairo>=1.10.0-6')
makedepends=('meson'
             'appstream-glib'
             'intltool'
             'gnome-doc-utils'
             'git'
             'itstool')
optdepends=('python-dbus: open a new tab in an already running instance')
conflicts=('meld' 'meld-dev')
provides=('meld')
install=meld.install
options=('!emptydirs')
source=("git+https://gitlab.gnome.org/GNOME/meld.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    git describe --always | sed 's|-|.|g'
}

prepare() {
    cd "$srcdir/$_pkgname"
}

build() {
    cd "$srcdir/$_pkgname"
    arch-meson build -D docs=true
    ninja -C build
}

package() {
    cd "$srcdir/$_pkgname"
    DESTDIR="${pkgdir}" meson install -C build
}
