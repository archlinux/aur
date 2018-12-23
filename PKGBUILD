# Maintainer:  Håvard Pettersson <mail@haavard.me>

_pkgname=nss-tls
pkgname=$_pkgname-git
pkgver=r35.86c005d
pkgrel=1
pkgdesc='A DNS over HTTPS resolver for glibc'
url='https://github.com/dimkr/nss-tls'
arch=(i686 x86_64)
license=('LGPL2.1')
depends=(glib2 libsoup json-glib)
makedepends=(git meson)
provides=($_pkgname)
conflicts=($_pkgname)
source=("$_pkgname::git+https://github.com/dimkr/nss-tls.git")
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build(){
  arch-meson $_pkgname build
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" ninja -C build install

  # TODO: report upstream
#  mkdir -p "$pkgdir"/usr/lib/systemd/system
#  mv "$pkgdir"/etc/systemd/system/nss-tlsd.service \
#    "$pkgdir"/usr/lib/systemd/system/nss-tlsd.service
#  (cd "$pkgdir" && rmdir -p etc/systemd/system)
}

# vim:set ts=2 sw=2 et:
