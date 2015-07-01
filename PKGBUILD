# Maintainer: petRUShka <petrushkin@yandex.ru>
pkgname=m210
pkgver=0.8
pkgrel=5
pkgdesc="M210 provides tools and an userspace device driver for Pegasus Tablet Mobile NoteTakers (or IRISnotes or MVPen or LogiPen or Yifang or Ritmix DP-305I\DP-205BT) Linux. It allows to fetching notes and converting them to SVG."
url="http://tjjr.fi/software/m210/"
arch=('x86_64' 'i686')
license=('GPLv3')
depends=()
optdepends=()
makedepends=()
conflicts=()
replaces=()
backup=()
install='m210.install'
source=("https://launchpad.net/m210/trunk/0.8/+download/m210-0.8.tar.gz")
md5sums=('c72c4de5a91df1c1dca58beadfac22b7')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
#  cmake ./ -DCMAKE_INSTALL_PREFIX=/usr
 ./configure --prefix=/usr
  make
  sed -i 's/plugdev/storage/' udev/rules.d/40-m210.rules
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
  install -Dm644 udev/rules.d/40-m210.rules "$pkgdir/usr/lib/udev/rules.d/40-m210.rules"
}

# vim:set ts=2 sw=2 et:
