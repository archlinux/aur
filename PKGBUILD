# Maintainer: Nemanja Nedeljkovic <nemanjan00@gmail.com>
# Contributor: David Manouchehri <manouchehri@riseup.net>
# Contributor: Thomas Krug <t.krug@elektronenpumpe.de>
# Contributor: veox <veox at wemakethings dot net>

_pkgname='libsigrokdecode'
pkgname="$_pkgname-nemanjan00-git"
pkgver=0.2.0.r1524.gd65933c
pkgrel=1
pkgdesc="Client software that supports various hardware logic analyzers, protocol decoders library (nemanjan00 fork: upstream plus extra decoders, e.g. Saleae Logic 2 HLA support)"
arch=('x86_64')
url="https://github.com/nemanjan00/libsigrokdecode"
license=('GPL-3.0-or-later')
depends=('python' 'glib2')
makedepends=('git')
provides=("$_pkgname" "$_pkgname-git")
conflicts=("$_pkgname" "$_pkgname-git")
source=("$_pkgname::git+https://github.com/nemanjan00/libsigrokdecode.git#branch=master")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --exclude libsigrokdecode-unreleased --long | sed 's/^libsigrokdecode-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_pkgname"
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "$_pkgname"
  make DESTDIR="$pkgdir" PREFIX=/usr install
}
