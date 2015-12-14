oldpkgname=eog
pkgname=gnome-eog
pkgver=3.18.1
pkgrel=1
pkgdesc="Eye of Gnome: An image viewing and cataloging program. Applied small patch for set screensaver image with wallpaper."
arch=(i686 x86_64)
license=(GPL)
depends=(gnome-desktop libexif lcms2 desktop-file-utils exempi libpeas librsvg dconf)
makedepends=(intltool itstool gobject-introspection patch)
conflicts=(eog)
install=eog.install
groups=(gnome)
options=('!emptydirs')
url="https://wiki.gnome.org/Apps/EyeOfGnome"
source=(http://ftp.gnome.org/pub/gnome/sources/$oldpkgname/${pkgver:0:4}/$oldpkgname-$pkgver.tar.xz
        '0001-Set-screensaver-image-two.patch')
sha256sums=('7b7bb47a680518701e2e724c8632fcf12dcb3c3e45ce1f2bdd4c4ace325793a7'
            '343d3fc67119737fe61ec5324a4a0cf2c6e6e3f66dfa2b238203314d5a03f055')

build() {
  cd "$oldpkgname-$pkgver"
  pwd
  ls -al
  patch -p1 < ../0001-Set-screensaver-image-two.patch
  ./configure --prefix=/usr --sysconfdir=/etc \
      --localstatedir=/var
  make
}

package() {
  cd "$oldpkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
