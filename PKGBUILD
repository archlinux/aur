# Maintainer: Jérôme Poulin <jeromepoulin@gmail.com>

_commit=13f82231c93879d3c7e3031b371879ee1f2d5bdc
_feature=-hugepages
pkgname=memtester${_feature}
pkgver=4.6.0
pkgrel=1
pkgdesc="fork of memtester adding -H to test 2M huge pages"
arch=('x86_64')
url="https://github.com/ticpu/memtester"
license=('GPL2')
depends=('glibc')
provides=(memtester)
conflicts=(memtester)
source=("git+https://github.com/ticpu/memtester?signed#commit=$_commit")
sha256sums=('5d0a5d1d280fdd3094f9f7700637b1914b7a6dd2162ec210f1f31224a3f2212f')
validpgpkeys=('E5998E49DC9E1DCFDB9B46EC77EBA10790CFFCCD')

build() {
  cd ${pkgname%$_feature}
  make
}

package() {
  cd ${pkgname%$_feature}

  install -D -m755 memtester "${pkgdir}/usr/bin/memtester"
  install -D -m644 memtester.8 "${pkgdir}/usr/share/man/man8/memtester.8"
}
