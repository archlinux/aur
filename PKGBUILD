# Maintainer: Kusoneko <kusoneko@kusoneko.moe>

pkgname=pounce-git
pkgver=3.1.r470.2abf0df
pkgrel=1
pkgdesc="A multi-client, TLS-only IRC bouncer"
arch=('x86_64')
url="https://git.causal.agency/pounce"
license=('GPL3')
makedepends=('git')
depends=('libretls' 'libxcrypt')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+https://git.causal.agency/${pkgname%-git}.git")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    printf "%s.r%s.%s" "$(git describe --tags --abbrev=0)" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	./configure --prefix=/usr --mandir=/usr/share/man
	make all
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make DESTDIR="$pkgdir/" install
}
