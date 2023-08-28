# Contibutor: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname=webdump
pkgname=webdump-git
pkgver=r154.f38059f
pkgrel=1
pkgdesc='HTML to plain-text converter tool'
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')
url='https://www.codemadness.org/git/webdump/file/README.html'
license=('ISC')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git://git.codemadness.org/$_pkgname")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  make WEBDUMP_CPPFLAGS="-D_DEFAULT_SOURCE" -C "$_pkgname"
}

package() {
  make DESTDIR="$pkgdir" PREFIX="/usr" MANPREFIX="/usr/share/man" -C "$_pkgname" install
  install -Dvm644 "$_pkgname/LICENSE" -t "$pkgdir/usr/share/licenses/$_pkgname"
}

# vim: ts=2 sw=2 et:
