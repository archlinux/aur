# Maintainer : bug <bug2000 at gmail dot com>
# Contributor: F0ruD <fzerorubigd[at]gmail[dot]com>

pkgname=winswitch
pkgver=0.12.21
pkgrel=1
pkgdesc="Window-Switch is a client server tool to start and control virtual desktops"
arch=('any')
url="https://winswitch.org/"
license=('GPL3')
depends=('pygtk' 'python2-crypto' 'twisted' 'python2-pyasn1' 'hicolor-icon-theme' 'desktop-file-utils')
optdepends=('nautilus: nautilus sendto'
            'thunar: thunar sendto'
            'parti-all: xpra support'
            'nss-mdns: mdns support'
            'nxproxy: proxy support'
            'python-netifaces: firewall detection'
            'java-environment: graphical server signatures')
options=('!emptydirs')
install="$pkgname.install"
source=("${url}src/$pkgname-$pkgver.src.tar.bz2")
md5sums=('8d1cf9fa65528d6fdbb058b06f68c787')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"

  # use lib instead of lib64
  sed -i "s|lib64|lib|" setup.py
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/"

  # python2 fixes
  sed -i "s/env python/&2/" `grep -rl "env python" "$pkgdir"`
}
