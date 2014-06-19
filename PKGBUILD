# Maintainer: Yen Chi Hsuan <yan12125 at gmail dot com>

pkgname=dhcptest-git
pkgver=0.3.r1.ga34cf82
pkgrel=1
pkgdesc="DHCP test client"
arch=('i686' 'x86_64')
url="https://github.com/CyberShadow/dhcptest"
license=('BSL1.0')
makedepends=('dmd')
source=("$pkgname"::'git://github.com/CyberShadow/dhcptest'
        'http://www.boost.org/LICENSE_1_0.txt')
md5sums=('SKIP'
         'e4224ccaecb14d942c71d31bef20d78c')

pkgver() {
  cd "$srcdir/$pkgname"
  # Use the tag of the last commit
  git describe --long --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$pkgname"
  dmd dhcptest.d
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 "dhcptest" "$pkgdir/usr/bin/dhcptest"
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/dhcptest/README.md"
  cd "$srcdir"
  install -Dm644 "LICENSE_1_0.txt" "$pkgdir/usr/share/licenses/dhcptest/LICENSE.txt"
}

