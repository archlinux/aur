# Maintainer: tuxce <tuxce.net@gmail.com>
# Maintainer: Igor <f2404@yandex.ru>
pkgname=package-query-git
pkgver=1.9.r10.gb912c5b
pkgrel=2
pkgdesc="Query ALPM and AUR"
arch=('i686' 'x86_64' 'mips64el' 'armv6h' 'armv7h' 'arm' 'aarch64')
url="https://github.com/archlinuxfr/package-query"
license=('GPL')
depends=('pacman>=5.1' 'yajl>=2.0')
makedepends=('git')
conflicts=('package-query')
provides=('package-query=1.9')
source=('git+https://github.com/archlinuxfr/package-query.git')
md5sums=('SKIP')
_gitname=package-query

pkgver () {
  cd "$_gitname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_gitname"
  ./autogen.sh
  ./configure --localstatedir=/var --prefix=/usr \
              --sysconfdir=/etc --with-aur-url=https://aur.archlinux.org
  make
}

package () {
  cd "$_gitname"
  make DESTDIR="$pkgdir" install
}
