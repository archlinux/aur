# Maintainer: dr460nf1r3 <dr460nf1r3 at garudalinux dot org>
# Contributor: Arnoud Willemsen <mail at lynthium dot com>

pkgname=firejail-noapparmor-git
_pkgname=firejail
pkgver=r7283.23ea15fd7
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
  cd "${srcdir}/${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)" | sed 's/^v//;s/-/./g'
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
