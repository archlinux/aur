_pkgname=linux-serial-test
pkgname="${_pkgname}-git"
pkgver=a
pkgrel=1
pkgdesc="Linux Serial Test Application"
url="https://github.com/cbrake/$_pkgname"
arch=('i686' 'x86_64' 'armv7h')
license=('MIT')
provides=("$_pkgname")
conflicts=("$_pkgname")
depends=('glibc')
makedepends=('cmake' 'git')
source=("git+https://github.com/cbrake/$_pkgname.git")
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  mkdir -p "$_pkgname/build"
  cd "$_pkgname/build"
  cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}

package() {
  cd "$_pkgname/build"
  make DESTDIR="${pkgdir}" install
  install -Dm644 "$srcdir/$_pkgname/LICENSES/MIT" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set syn=sh ts=2 sw=2 et:
