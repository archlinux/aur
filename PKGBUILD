# Maintainer: John FrostFox <john.frostfox at gmail dot com>
pkgname=nautilus-folder-cleaner-extension-git
pkgver=1.0.5.r0.gf8dd2b7
pkgrel=1
pkgdesc="Sorts files into folders by type or extension - Nautilus extension"
arch=('any')
url="https://gitlab.com/Latesil/folder-cleaner-extension"
license=('GPL3')
depends=('python-nautilus')
makedepends=('meson' 'ninja' 'git' 'intltool' 'appstream-glib')
source=(${pkgname}-${pkgver}::'git+'${url}'.git')
md5sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g;s/rc.\.//'
}

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
    arch-meson --buildtype=plain build
    ninja -C build
}

check() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	arch-meson check 
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    DESTDIR="$pkgdir" ninja -C build install
}