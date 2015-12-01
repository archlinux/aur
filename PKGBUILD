# Maintainer: Faheem Pervez < trippin1 gmail >
# Contributor: 3ED_0 <krzysztof1987 at gamil.com>
# Contributor: Roman Kyrylych <roman@gmail.com>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=eiciel-git
pkgver=0.9.11.r54.29785ab
pkgrel=2
pkgdesc="GNOME 3 file ACL editor (Git version)"
arch=('i686' 'x86_64')
url="http://rofi.roger-ferrer.org/eiciel/"
license=('GPL')
makedepends=('git')
depends=('acl' 'gtkmm3' 'libnautilus-extension' 'desktop-file-utils' 'hicolor-icon-theme' 'xdg-utils')
optdepends=('nautilus: show ACLs in Nautilus'\'' file property dialogs'
            'yelp: show help pages')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
options=('!libtool')
install="$pkgname.install"
source=("${pkgname%-git}::git+git://github.com/rofirrim/eiciel.git")
md5sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"

  # Stolen from the gtk-engine-murrine-git package  
  _ver=$(grep AC_INIT configure.ac | sed 's/[^0-9.]//g')
  _rev=$(git rev-list --count HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%sr%s.%s" "$_ver" "$_rev" "$_hash"
}

build() {
  cd "${pkgname%-git}"
  autoreconf -vif
  ./configure --prefix=/usr
  make
}

package() {
  cd "${pkgname%-git}"
  make DESTDIR="$pkgdir/" install
}

