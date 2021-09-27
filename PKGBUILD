# Maintainer: Buce <dmbuce@gmail.com>

pkgname=buceutils-git
pkgver=0.r75.g9fcdf21
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
  tar
  p7zip
  gzip
  bzip2
  unrar
  xz
  unzip
  java-environment
  rpmextract
  cpio
  cabextract
  curl
  openssh
  diffutils
  perl
  perl-net-cidr-lite
  perl-spreadsheet-writeexcel
  alsa-utils
  xorg-xrandr
  xclip
  awk
  imagemagick
  python
  restic
)
makedepends=('git')
provides=(buceutils)
conflicts=(buceutils)
replaces=()
backup=(
	etc/resticbackup.d/config
	etc/resticbackup.d/exclude
	etc/resticbackup.d/password
	etc/bashrc.d/functions.sh
	etc/bashrc.d/basic.sh
	etc/bashrc.d/restic.sh
	etc/bashrc.d/colorterm.sh
	etc/bashrc.d/root.sh
	etc/bashrc.d/login.sh
	etc/bashrc.d/vars.sh
	etc/bashrc.d/misc.sh
	etc/bash_completion.d/buceutils
)
options=()
install=
source=("$pkgname::git+https://github.com/DMBuce/${pkgname%-git}.git")
#source=("$pkgname::git+ssh://git@mantrid/~/${pkgname%-git}.git")
md5sums=('SKIP')

package() {
  cd "$srcdir/$pkgname"
  make prefix=/usr sysconfdir=/etc localstatedir=/var DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
