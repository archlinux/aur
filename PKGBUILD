# Maintainer: Thomas Nordenmark <t.nordenmark@gmail.com>

pkgname="compton-conf"
pkgver=0.1.0
pkgrel=1
pkgdesc="Configuration manager for X compositor compton"
arch=('i686' 'x86_64')
url="https://github.com/lxde/compton-conf"
license=('GPL2' 'LGPL2.1')
depends=('qt4' 'libconfig')
makedepends=('cmake>=2.8.6')
optdepends=('compton: The actual compositor to configure'
            'compton-git: The actual compositor to configure (git-version)')
conflicts=('compton-conf-git')
source=("https://github.com/lxde/compton-conf/archive/$pkgver.tar.gz")
md5sums=('767ace41462d947f161d13edfee61f8b')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cmake -DCMAKE_INSTALL_PREFIX="/usr"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
  sed -i 's/LXQt/X-LXQt/g' "compton-conf.desktop"
  install -D -m644 "compton-conf.desktop" "${pkgdir}/usr/share/applications/"
  install -D -m644 "COPYING" "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

