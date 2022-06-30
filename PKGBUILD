_pkgname=zihap
pkgname=zihap-git
pkgver=1.0.r23.gefcc4cb
pkgrel=1
pkgdesc="zihap is a Unified Messaging and Social Media Apps which combines all your messaging services and social media into one single windows."
arch=('i686' 'x86_64')
url="https://gitlab.com/exkc/zihap/"
license=('custom:M/IT/X')
depends=('gtk3' 'glib2' 'webkit2gtk' 'gcr' 'libxft' 'tomlc99-git')
makedepends=('git')
optdepends=("gstreamer: play video in zihap")

provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+https://gitlab.com/exkc/zihap")
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

