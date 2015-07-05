# Contributors:
#   henning mueller <henning@orgizm.net>
#   schalox <schalox at gmail dot com>
#   Florian Dejonckheere <floriandejonckheere.be>

pkgname=system-config-lvm
pkgver=1.1.18
_fedora_rel=1.fc19
pkgrel=4
pkgdesc='A utility for graphical configuration of Logical Volumes'
arch=(any)
url="http://fedoraproject.org/wiki/SystemConfig/lvm"
license=(GPL)
depends=(gtk2 gnome-python pygtk lvm2 gksu)
makedepends=(intltool)
source=(
  http://kojipkgs.fedoraproject.org/packages/${pkgname}/${pkgver}/${_fedora_rel}/src/${pkgname}-${pkgver}-${_fedora_rel}.src.rpm
)

prepare() {
  cd "$srcdir"
  tar xzf $pkgname-$pkgver.tar.gz
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr --sysconfdir=/etc --sbindir=/usr/bin
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  ln -fs \
    /usr/share/$pkgname/$pkgname.py \
    "$pkgdir/usr/bin/$pkgname"
}

sha256sums=('fa04b869afa5b690b040e02e70c1d23e79d25481fac4f95d74c8f98d9158bbe6')
