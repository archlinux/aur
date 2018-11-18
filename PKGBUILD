# $Id: PKGBUILD 341654 2018-06-07 06:05:44Z felixonmars $
# Maintainer: Sébastien Luttringer <seblu@archlinux.org>

pkgname=sysvbanner
pkgver=1.0.15
pkgrel=3
pkgdesc='System-V banner clone'
arch=('x86_64')
url='http://packages.qa.debian.org/s/sysvbanner.html'
depends=('glibc')
conflicts=('bsd-games')
license=('custom')
source=("http://ftp.debian.org/debian/pool/main/s/sysvbanner/${pkgname}_${pkgver}.tar.gz"
        '01-man.patch')
sha512sums=('55987c3dbaf898e80476a08e755194480760a59b78eb879c3db11994b0ed6e11894ffc762a932ad0d95decf9dcb46dc9d905210788f1ce1dad14e00895654409'
            '14255d0a35be028728095921e3153861cd296612ab790e213413cc7f4da7690f60451ea76952f7877c17538c13cb44da71f353278c06f3700845656c9d98d609')

prepare() {
  cd $pkgname-$pkgver
  # apply patch from the source array (should be a pacman feature)
  local filename
  for filename in "${source[@]}"; do
    if [[ "$filename" =~ \.patch$ ]]; then
      msg2 "Applying patch ${filename##*/}"
      patch -p1 -N -i "$srcdir/${filename##*/}"
    fi
  done
  :
}

build() {
  cd $pkgname-$pkgver
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
  install -D -m444 "debian/copyright" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
