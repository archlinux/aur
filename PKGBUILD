# Maintainer: The-Repo-Club <The-Repo-Club@github.com>
# Contributor: The-Repo-Club <The-Repo-Club@github.com>
pkgname=instawm
pkgver=2021.04.27
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
sha256sums=('7b535ee689f7a5e2cec42795ed1129aa2717935f6b6031a4a010c53f91d034c3')

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
