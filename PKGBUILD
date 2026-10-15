# Maintainer: Eser KUBALI <eserlxl@gmail.com>
pkgname=linux-tmpcleaner
pkgver=1.0.0
pkgrel=1
pkgdesc="Systemd timer that deletes old /tmp entries while protecting files in use"
arch=('any')
url="https://github.com/eserlxl/tmpCleaner"
license=('GPL-3.0-or-later')
depends=('bash' 'coreutils' 'findutils' 'gawk' 'grep' 'sed' 'systemd>=249')
# The unrelated AUR package "tmpcleaner" also ships /usr/bin/tmpcleaner.
conflicts=('tmpcleaner')
backup=('etc/tmpcleaner/tmpcleaner.conf')
install=tmpcleaner.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
# Pinned sha256 of the v$pkgver release tarball. The tarball holds this file,
# so after each version bump run `updpkgsums` once the tag is pushed and commit
# the pin separately; never publish with 'SKIP'.
sha256sums=('58832b55137240dfa02a7450371bb65f600059fbf0eeb66fcc368d9d2162ab0f')

check() {
  cd "$srcdir/tmpCleaner-$pkgver"
  make test
}

package() {
  cd "$srcdir/tmpCleaner-$pkgver"
  make install DESTDIR="$pkgdir" PREFIX=/usr UNITDIR=/usr/lib/systemd/system
}
