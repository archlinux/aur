# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=cov-analysis
pkgver=2020.09
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
sha256sums_i686=('d251243887c3219738bae254c6bfcbc24ccde9633a53283587576d333d41bff0')
sha256sums_x86_64=('dd520c04197d58d01e2b3cdaf4fe67d8e9af8e55236e556a19fb0d0a72531223')

package() {
  install -dm755 "$pkgdir/opt/$pkgname"
  mv $pkgname-*-$pkgver/* "$pkgdir/opt/$pkgname"
  chown root: -R "$pkgdir/opt/$pkgname/"

  cd "$srcdir"
  install -d "$pkgdir/etc/profile.d"
  printf > "$pkgdir/etc/profile.d/$pkgname.sh" \
    'export PATH="$PATH":%s\n' \
    "/opt/$pkgname/bin"
  chmod 644 "$pkgdir/etc/profile.d/$pkgname.sh"
}
