# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=cov-analysis
pkgver=2019.03
pkgrel=3
pkgdesc='Coverity Scan Build Tool for C/C++ - REQUIRES MANUAL DOWNLOAD'
url='https://scan.coverity.com/download'
arch=('i686' 'x86_64')
license=('custom')
depends=('java-environment')
makedepends=('libarchive')
options=('!strip')

source_i686=(  "cov-analysis-linux-$pkgver.tar.gz")
source_x86_64=("cov-analysis-linux64-$pkgver.tar.gz")
sha256sums_i686=('a0e6c35db1effbbc33194f5aa8db63619911306314ce29c278a0bec2002038ed')
sha256sums_x86_64=('831289253c4630423cdb3dc7b80782b045c0dbf66d0fee51e8337025fe23b72b')

package() {
  tar=$(echo *.tar)
  msg2 "Extracting $tar with bsdtar"
  install -dm755 "$pkgdir/opt/$pkgname"
  cd "$pkgdir/opt/$pkgname"
  bsdtar --strip-components=1 -xf "$srcdir/$tar"
  chown root: -R "$pkgdir/opt/$pkgname/"

  cd "$srcdir"
  install -d "$pkgdir/etc/profile.d"
  printf > "$pkgdir/etc/profile.d/$pkgname.sh" \
    'export PATH="$PATH":%s\n' \
    "/opt/$pkgname/bin"
  chmod 644 "$pkgdir/etc/profile.d/$pkgname.sh"
}
