# Maintainer: The-Repo-Club <The-Repo-Club@github.com>
# Contributor: The-Repo-Club <The-Repo-Club@github.com>
pkgname=instawm
pkgver=2021.04.09
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
sha256sums=('e11e3460f805aaa68db7fd72c87e60a4c496fdc60e796ad30e6078a3c7a3f8e1')

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
