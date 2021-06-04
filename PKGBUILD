# Maintainer: TheRepoClub <TheRepoClub@github.com>
# Contributor: TheRepoClub <TheRepoClub@github.com>
pkgname=instawm-schemas
pkgver=2021.06.04
pkgrel=1
pkgdesc="addons for instawm"
url="https://github.com/The-Repo-Club/$pkgname"
arch=('any')
groups=('therepoclub')
license=('CC BY-NC-SA 4.0')
provides=("instawm-schemas=$pkgver")
depends=('glib2' 'dconf')
makedepends=('gobject-introspection' 'git' 'meson')
source=("${pkgname}-$pkgver.tar.gz::${url}/archive/$pkgver.tar.gz")
sha256sums=('dfdbc5a4cd6809c0c773ed4cd48bed16f377fe1655f3f87f200900a18d73f660')

prepare() {
    cd "$srcdir/$pkgname-$pkgver"
}

build() {
    arch-meson $srcdir/$pkgname-$pkgver build
    ninja -C build
}

check() {
    meson test -C build
}

package() {
    mkdir -p $pkgdir/usr/bin
    cp -a $srcdir/$pkgname-$pkgver/$pkgname $pkgdir/usr/bin/$pkgname
    DESTDIR="$pkgdir" meson install -C build
}
