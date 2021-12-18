# Contributor: Eric Fung <loseurmarbles[AT]gmail[DOT]com>
# Contributor: James An <james@jamesan.ca>
# Contributor: Bartek Piotrowski <barthalion@gmail.com>
# Contributor: 3ED <krzysztof1987 at googlemail>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: pressh <pressh@gmail.com>

pkgname=alacarte-xfce
_pkgname=${pkgname%-xfce}
pkgver=3.42.0
pkgrel=1
pkgdesc="Menu editor for Xfce"
arch=('any')
license=('LGPL')
url="http://www.gnome.org"
groups=('xfce4-goodies')
depends=('gnome-menus' 'gtk3' 'hicolor-icon-theme' 'python-cairo' 'python-gobject')
makedepends=('gnome-common')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname" "$_pkgname-git" "$_pkgname-xfce-devel")
install="${_pkgname}.install"
source=("https://gitlab.gnome.org/GNOME/${_pkgname}/-/archive/${pkgver}/${_pkgname}-${pkgver}.tar.gz"
        'unicode.patch')
sha256sums=('4b3958ce96c7ae85b0681223d4de1ecd28312d0cee37b6baa23c968053a3586d'
            '7bba758089ffb1c7e293cccef1de252f91f8951dd0b4a3558cef81fd1c4998a7')

prepare() {
  cd "${_pkgname}-${pkgver}"

  patch -p1 < ../unicode.patch
}

build() {
  cd "${_pkgname}-${pkgver}"

  NOCONFIGURE=1 ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "${_pkgname}-${pkgver}"

  DESTDIR="${pkgdir}" make install
}
