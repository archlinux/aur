# Maintainer: The-Repo-Club <The-Repo-Club@github.com>
# Contributor: The-Repo-Club <The-Repo-Club@github.com>
pkgname=instawm
pkgver=2021.04.15
pkgrel=1
pkgdesc="A dynamic window manager for X"
url="https://github.com/The-Repo-Club/instawm"
arch=('i686' 'x86_64')
groups=('therepoclub')
license=('CC BY-NC-SA 4.0')
options=(zipman)
depends=('libx11' 'libxinerama' 'libxft' 'freetype2' 'instamenu' 'ttf-remixicon')
install=instawm.install
source=("${pkgname}-$pkgver.tar.gz::${url}/archive/$pkgver.tar.gz")
sha256sums=('31a0a3b4d7d09e2574eef27f15dcd51568a564ccb223c7412b894bf71f7b7ea0')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make \
    X11INC=/usr/include/X11 \
    X11LIB=/usr/lib/X11 \
    FREETYPEINC=/usr/include/freetype2
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr DESTDIR="$pkgdir" install
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
