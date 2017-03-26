# Maintainer: Charles Bos <charlesbos1 AT gmail>
# Contributor: Martin Wimpress <code@flexion.org>

pkgname=mate-themes-git
_realname=mate-themes
pkgver=r1386.a773ee09
pkgrel=1
pkgdesc="Default themes for the MATE desktop"
url="http://mate-desktop.org"
arch=('any')
license=('GPL')
makedepends=('gtk2' 'intltool' 'mate-common')
optdepends=('gtk-engines: for gtk2 themes'
            'gtk-engine-murrine: for gtk2 themes'
            'mate-icon-theme: default icon theme')
conflicts=('mate-themes')
provides=('mate-themes')
options=('!emptydirs')
groups=('mate')
source=("git+https://github.com/mate-desktop/mate-themes.git")
sha1sums=('SKIP')

pkgver() {
  cd ${_realname}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd ${_realname}
    ./autogen.sh \
        --prefix=/usr
    make
}

package() {
    cd ${_realname}
    make DESTDIR="${pkgdir}" install
}
