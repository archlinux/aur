# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=cov-analysis
pkgver=2021.12
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
sha256sums_i686=('797f0441478bca947d22146dd1a85182ca2b2d823e3fee05c100527b382af44a')
sha256sums_x86_64=('27cab83852aa86dd701398d7d74b1a619d5f9d1a26d0e4ac57543de5565be6d9')

package() {
  install -dm755 "$pkgdir/opt/$pkgname"
  mv $pkgname-*-$pkgver*/* "$pkgdir/opt/$pkgname"
  chown root: -R "$pkgdir/opt/$pkgname/"

  cd "$srcdir"
  install -d "$pkgdir/etc/profile.d"
  printf > "$pkgdir/etc/profile.d/$pkgname.sh" \
    'export PATH="$PATH":%s\n' \
    "/opt/$pkgname/bin"
  chmod 644 "$pkgdir/etc/profile.d/$pkgname.sh"
}
