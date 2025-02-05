# Maintainer: willemw <willemw12@gmail.com>
# Contributor: Alexander De Sousa <archaur.xandy21@spamgourmet.com>
# Contributor: Jeff Mickey <j@codemac.net>

pkgname=speedometer
#_debianver=2.8-3    # Debian fork
pkgver=2.9
pkgrel=3
pkgdesc='Measure and display the rate of data across a network connection or data being stored in a file'
arch=(any)
url=https://excess.org/speedometer
license=(LGPL-2.1-or-later)
#depends=(python-psutil python-six python-urwid)    # Debian fork
depends=(python-psutil python-urwid)
#source=("http://ftp.us.debian.org/debian/pool/main/s/speedometer/speedometer_${_debianver}_all.deb")    # Debian fork
source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/wardi/speedometer/archive/refs/tags/release-$pkgver.tar.gz"
  remove_pkg_resources.patch)
sha1sums=(
  '7c113356a31d2bc7bb53255661c6f3757025d76e'
  'ecb70cd6a475c3bf423b5f9b227be24ddda646a1')

prepare() {
  patch --directory=$pkgname-release-$pkgver --forward --strip=1 --input="$srcdir/remove_pkg_resources.patch"
  sed -i "s/__version__ = .*/__version__ = '$pkgver'/" $pkgname-release-$pkgver/speedometer.py
}

#package() {
#  # Debian fork
#  bsdtar xf data.tar.xz --directory="$pkgdir/" usr/bin/speedometer usr/share/doc/speedometer/ usr/share/man/
#}

package() {
  install -Dm755 $pkgname-release-$pkgver/speedometer.py "$pkgdir/usr/bin/speedometer"
}
