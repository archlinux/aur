# Maintainer: Cyrinux <pkgbuilds AT levis DOT name>
pkgname=firetunnel-git
pkgver=master
pkgrel=5
pkgdesc="Tunneling program for Firejail sandboxes"
arch=('any')
url="https://github.com/netblue30/firetunnel"
license=('GPL')
makedepends=('git')
provides=('firetunnel')
conflicts=('firetunnel')
source=("git+https://github.com/netblue30/firetunnel.git")
sha512sums=('SKIP')
backups=('/etc/firetunnel/firetunnel.secret')

pkgver() {
  cd "${srcdir}/firetunnel"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/firetunnel"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/firetunnel"
  make DESTDIR="${pkgdir}" install-strip
}
