# Contributor: Zeph <zeph33@gmail.com>
# Maintainer: Zeph <zeph33@gmail.com>

pkgname=pamac-aur
pkgver=4.1rc1
_pkgver=d7712e90ac7d41098cb608d8ef796f1f80969db3
pkgrel=1
pkgdesc="A Gtk3 frontend for libalpm"
arch=('any')
url="https://github.com/manjaro/pamac"
license=('GPL3')
depends=('glib2>=2.42' 'json-glib' 'libsoup' 'dbus-glib' 'polkit' 'vte3>=0.38' 'gtk3>=3.18'
         'libnotify' 'desktop-file-utils' 'pacman>=5.0' 'pacman<5.1' 'gnutls>=3.4')
optdepends=('yaourt: needed for AUR support')
makedepends=('gettext' 'itstool' 'vala>=0.28')
backup=('etc/pamac.conf')
provides=('pamac')
conflicts=('pamac')
options=(!emptydirs)
install=pamac.install

source=("pamac-$pkgver-$pkgrel.tar.gz::https://github.com/manjaro/pamac/archive/$_pkgver.tar.gz")
#        recurse.patch::https://github.com/manjaro/pamac/commit/2282fa561b6e9b3a93db081c59143743ad6aef1b.patch)
sha256sums=('37a44c2320d7c562740530ee6401898c2d0eda96ad6ee7de1106dde048c21c23')
#            '7840c045c02a49b75158f54faff35c7b12e32a02bdc364790835ef2639ae580a')
  
prepare() {
  # adjust version string
  cd "$srcdir/pamac-$_pkgver"
  sed -i -e "s|\"4.1.0\"|\"$pkgver-$pkgrel\"|g" src/transaction.vala 
  # patches here
#  patch -Np1 -i $srcdir/recurse.patch
}

build() {
  cd "$srcdir/pamac-$_pkgver"

  # build
  make all
}

package() {
  cd "$srcdir/pamac-$_pkgver"
  make prefix="$pkgdir"/usr sysconfdir="$pkgdir"/etc install
}

# vim:set ts=2 sw=2 et:
