# Maintainer: Oleg Senin <trashmessage@yandex.ru>
pkgname=pyflame-git
pkgver=r116.b2bfad0
pkgrel=1
pkgdesc="A tool for generating flame graphs for Python processes."
arch=('i686' 'x86_64')
url="https://github.com/uber/pyflame"
license=('APACHE')
depends=('gcc-libs')
makedepends=('autoconf' 'automake' 'gcc>=4.6' 'git')
conflicts=('pyflame')
source=("$pkgname::git+https://github.com/uber/pyflame.git")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "$pkgname"
  ./autogen.sh
  ./configure --prefix=/usr --with-python=python3
  make
}

package() {
  cd "$pkgname"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
