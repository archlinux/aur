pkgname=podpisuj
pkgver=5.7.120
pkgrel=1
pkgdesc="Podpisuj - signature software from Slovakia"
arch=('x86_64')
url="https://www.podpisuj.sk/"
license=('custom')
depends=('glibc' 'xdg-utils')
makedepends=('binutils' 'libarchive')
options=('!emptydirs')
install="${pkgname}.install"
source=("https://www.podpisuj.sk/staticweb/install/${pkgname}-${pkgver}.deb")
sha256sums=('c8861affd1d259efe5bd580f76f3eab59c5d4326ba489f8ed40b0a4b76c9bc6d')

prepare() {
  ar x "${pkgname}-${pkgver}.deb"
  bsdtar -xf data.tar.zst -C "$srcdir"
}

package() {
  cd "$srcdir"

  install -d "$pkgdir"
  [ -d opt ] && cp -a opt "$pkgdir/"
  [ -d usr ] && cp -a usr "$pkgdir/"
  [ -d etc ] && cp -a etc "$pkgdir/"
  [ -d lib ] && cp -a lib "$pkgdir/"

  install -d "$pkgdir/usr/bin"
  ln -s /opt/podpisuj/bin/Podpisuj "$pkgdir/usr/bin/podpisuj"

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm0644 "$srcdir/opt/podpisuj/share/doc/copyright" \
    "$pkgdir/usr/share/licenses/$pkgname/license"
}
