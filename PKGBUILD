# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=cov-analysis
pkgver=2022.06
pkgrel=1
pkgdesc='Coverity Scan Build Tool for C/C++ - REQUIRES MANUAL DOWNLOAD'
url='https://scan.coverity.com/download'
arch=('i686' 'x86_64')
license=('custom')
depends=('java-environment')
makedepends=('libarchive')
options=('!strip')

source_i686=(  "file://cov-analysis-linux-$pkgver.tar.gz")
source_x86_64=("file://cov-analysis-linux64-$pkgver.tar.gz")
sha256sums_i686=('e12173d5ba71b76212aaf24b3c863807aa8fa02781aafacd8d661542e36a5f6e')
sha256sums_x86_64=('5708070dc9d7e2e9468f8ab766d70ea00e6017b06698556ca1557a513b5724dc')

package() {
  install -dm755 "$pkgdir/opt/$pkgname"
  mv $pkgname-*-${pkgver//.0/.}*/* "$pkgdir/opt/$pkgname"
  chown root: -R "$pkgdir/opt/$pkgname/"

  cd "$srcdir"
  install -d "$pkgdir/etc/profile.d"
  printf > "$pkgdir/etc/profile.d/$pkgname.sh" \
    'export PATH="$PATH":%s\n' \
    "/opt/$pkgname/bin"
  chmod 644 "$pkgdir/etc/profile.d/$pkgname.sh"
}
