# Maintainer: Miroslav Koskar (http://mkoskar.com/)

_basename='libaosd-xinerama'
_upstreamver='0.2.7'
_pkgbuildver=1

pkgname='libaosd-xinerama-git'
pkgver="$_upstreamver.r0.0.$_pkgbuildver"
pkgrel=1
pkgdesc='libaosd (Atheme OSD) with Xinerama support and aosd_cat enhancements'
url='https://github.com/mkoskar/libaosd-xinerama'
license=('MIT')
arch=('i686' 'x86_64')
depends=('libxcomposite' 'libxinerama' 'pango')
provides=('libaosd')
conflicts=('libaosd')
makedepends=('git')

source=("git+https://github.com/mkoskar/$_basename.git")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$_basename"
    printf '%s.r%s.%s.%s' "$_upstreamver" \
                          "$(git rev-list --count HEAD)" \
                          "$(git rev-parse --short HEAD)" \
                          "$_pkgbuildver"
}

build() {
    cd "$srcdir/$_basename"
    ./autogen.sh
    ./configure --prefix=/usr
    make
}

package() {
    cd "$srcdir/$_basename"
    make DESTDIR="$pkgdir" install
    install -D -m 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
