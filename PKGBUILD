# Maintainer: Yen Chi Hsuan <yan12125 at gmail dot com>

_pkgname=dhcptest
pkgname=$_pkgname-git
pkgver=0.5.r11.g5bf3c44
pkgrel=1
pkgdesc="DHCP test client"
arch=('i686' 'x86_64')
url="https://github.com/CyberShadow/dhcptest"
license=('custom:BSL1.0')
depends=('glibc' 'gcc-libs')
makedepends=('dmd' 'git')
source=("$_pkgname"::"git+https://github.com/CyberShadow/dhcptest"
        'http://www.boost.org/LICENSE_1_0.txt')
md5sums=('SKIP'
         'e4224ccaecb14d942c71d31bef20d78c')

pkgver() {
  cd "$srcdir/$_pkgname"
  # Use the tag of the last commit
  git describe --long --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_pkgname"
  dmd dhcptest.d
}

package() {
  cd "$srcdir/$_pkgname"
  install -Dm755 "dhcptest" "$pkgdir/usr/bin/dhcptest"
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/dhcptest/README.md"
  cd "$srcdir"
  install -Dm644 "LICENSE_1_0.txt" "$pkgdir/usr/share/licenses/dhcptest-git/LICENSE.txt"
}

