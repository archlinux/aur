# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: nemstar

pkgname=sunflower-git
pkgver=0.6.64.r0.g4feeec4
pkgrel=1
pkgdesc="Small and highly customizable twin-panel file manager for Linux with support for plugins"
arch=(any)
license=(GPL-3.0-or-later)
url="https://github.com/MeanEYE/Sunflower"
depends=(
    gtk3
    vte3
    python
    python-gobject
    python-chardet
    python-cairo
    #librsvg
    libnotify
    gdk-pixbuf2
    glib2
    pango
    python-mutagen
    gtk4
    graphene
    python-importlib-metadata
    gtksourceview4
    gtksourceview5
    )
makedepends=(
    git
    python-setuptools
    )
optdepends=(
    'gvfs: mount-management'
    gnome-keyring
    )
provides=(sunflower)
conflicts=(sunflower)
source=("git+https://github.com/MeanEYE/Sunflower.git#branch=v0.6")
sha256sums=('SKIP')

pkgver() {
  cd "Sunflower"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "Sunflower"
  python setup.py build
}

package() {
  cd "Sunflower"
  python setup.py install --root="${pkgdir}/" --optimize=1  --skip-build

  #install -Dm644 images/sunflower.png "${pkgdir}/usr/share/pixmaps/sunflower.png"
  #rm "${pkgdir}/usr/share/sunflower/images/sunflower.png"
  #rm -f "${pkgdir}"/usr/share/locale/*/LC_MESSAGES/*.po
  #rm -f "${pkgdir}"/usr/share/locale/*.pot
}

#https://github.com/MeanEYE/Sunflower/blob/develop/dist/PKGBUILD
#https://github.com/MeanEYE/Sunflower/blob/develop/INSTALL
