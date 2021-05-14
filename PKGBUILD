# Maintainer: dr460nf1r3 <dr460nf1r3 at garudalinux dot org>
# Contributor: Arnoud Willemsen <mail at lynthium dot com>

pkgname=firejail-noapparmor-git
_pkgname=firejail
pkgver=0.9.64.r836.gc9e7fe8ab
pkgrel=1
pkgdesc="Linux namespaces sandbox program (GIT version without apparmor)"
arch=(i686 x86_64)
license=(GPL2)
url="https://github.com/netblue30/firejail"
source=("${_pkgname}::git+https://github.com/netblue30/firejail.git")
install=firejail.install
sha512sums=('SKIP')
conflicts=('firejail')
provides=('firejail')
depends=('xdg-dbus-proxy')
makedepends=('git')
backup=('etc/firejail/login.users'
        'etc/apparmor.d/local/firejail-default'
        'etc/firejail/firejail.config')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${_pkgname}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${_pkgname}"
  make DESTDIR="${pkgdir}" install
}
