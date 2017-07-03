pkgname=auracle-git
_pkgname=auracle
pkgver=r13.b7da67f
pkgrel=1
pkgdesc='A flexible client for the AUR'
arch=('x86_64' 'i686')
url="https://github.com/falconindy/auracle.git"
license=('MIT')
depends=('libalpm.so' 'libarchive.so' 'libcurl.so')
makedepends=('meson' 'git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+https://github.com/falconindy/auracle.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build () {
  cd "$_pkgname"

  meson build --prefix /usr -D buildtype=release
  ninja -C build
}

package () {
  cd "$_pkgname"

  DESTDIR=$pkgdir ninja -C build install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: et ts=2 sw=2
