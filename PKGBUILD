# Maintainer: Arnoud Willemsen <mail at lynthium dot com>

pkgname=firejail-git
pkgver=0.9.70.r8682.160ccd3d9
pkgrel=1
pkgdesc="Linux namespaces sandbox program (GIT version)"
arch=(i686 x86_64)
license=(GPL2)
url="https://github.com/netblue30/firejail"
source=("${pkgname}::git+https://github.com/netblue30/firejail.git")
install=firejail.install
sha512sums=('SKIP')
conflicts=('firejail')
provides=('firejail')
depends=('apparmor')
optdepends=('xdg-dbus-proxy')
makedepends=('git')
backup=('etc/firejail/login.users'
        'etc/apparmor.d/local/firejail-default'
        'etc/firejail/firejail.config'
        'etc/firejail/firecfg.config')

pkgver() {
  cd "${srcdir}/${pkgname}"
  printf "%s.r%s.%s" "$(git describe --tags --abbrev=0)" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)" | sed 's/^v//;s/-/./g'
}

build() {
  cd "${srcdir}/${pkgname}"
  ./configure --prefix=/usr --enable-apparmor
  make
}

package() {
  cd "${srcdir}/${pkgname}"
  make DESTDIR="${pkgdir}" install
}

# vim: set ts=2 sw=2 et:
