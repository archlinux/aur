# Maintainer: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>
# Contributor: Travis Willard <travis@archlinux.org>
# Contributor: Paul Mattal <paul@mattal.com>
# Contributor: Thanasis Georgiou <contact@thgeorgiou.com>

pkgname=imwheel
pkgver=1.0.0pre12
pkgrel=5
pkgdesc='Mouse wheel configuration tool for XFree86/Xorg'
arch=(i686 x86_64)
url='http://imwheel.sourceforge.net'
license=('GPL')
depends=('libxtst' 'libxmu')
backup=(etc/X11/imwheel/imwheelrc)
source=("http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz"
        'etcdir-install.patch')
sha256sums=('2320ed019c95ca4d922968e1e1cbf0c075a914e865e3965d2bd694ca3d57cfe3'
            '602a466e5537e7edb53247648fef62ea5bfa51e56f68dfd9f4fcb4b19e38fd16')

build() {
  cd "$pkgname-$pkgver"

  # patch to fix buggy location of ETCDIR
  patch -p1 -i "${srcdir}/etcdir-install.patch"

  ./configure --prefix=/usr --mandir=/usr/share/man
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
