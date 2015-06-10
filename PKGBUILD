# Maintainer: Buce <dmbuce@gmail.com>

pkgname=buceutils-git
pkgver=0.r50.g29583d6
pkgver() {
  cd "$srcdir/$pkgname"
  if ! git describe --tags 2>/dev/null; then
    echo "0.r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
  fi | sed 's/-/.r/; s/-/./g'
}
pkgrel=1
pkgdesc="A collection of simple utilities."
arch=(any)
url="https://github.com/DMBuce/buceutils"
license=('unknown')
groups=()
depends=(
  'tar' 'p7zip' 'gzip' 'bzip2' 'unrar' 'xz' 'unzip' 'java-environment'
  'rpmextract' 'cpio' 'cabextract' 'curl' 'openssh' 'diffutils' 'perl'
  'perl-net-cidr-lite' 'perl-spreadsheet-writeexcel' 'alsa-utils'
  'xorg-xrandr' 'awk' 'imagemagick' 'python'
)
makedepends=('git')
provides=(buceutils)
conflicts=(buceutils)
replaces=()
backup=()
options=()
install=
source=("$pkgname::git://github.com/DMBuce/${pkgname%-git}.git")
#source=("$pkgname::git+ssh://git@mantrid/~/${pkgname%-git}.git")
md5sums=('SKIP')

package() {
  cd "$srcdir/$pkgname"
  make prefix=/usr sysconfdir=/etc localstatedir=/var DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
