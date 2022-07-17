_pkgname=zihap
pkgname=zihap-git
pkgver=1.0.r64.gf4c6b0f
pkgrel=0
pkgdesc="zihap is a Unified Messaging and Social Media Apps which combines all your messaging services and social media into one single windows."
arch=('i686' 'x86_64')
url="https://exxxxkc.tildepages.org/ziweb/@site"
license=('custom:M/IT/X')
depends=('gtk3' 'glib2' 'webkit2gtk' 'gcr' 'libxft' 'tomlc99-git')
makedepends=('git')
optdepends=("gstreamer: play video in zihap")

provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+https://codeberg.org/exxxxkc/zihap")
md5sums=('SKIP')

pkgver() {
  cd "$_pkgname"
git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_pkgname"
  make PREFIX=/usr DESTDIR="$pkgdir"
}

package() {
  cd "$_pkgname"
  make PREFIX=/usr DESTDIR="$pkgdir" install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:

