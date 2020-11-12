# Maintainer: Christoph Rissner <resi@rissner.net>
pkgname=1px-git
pkgver=r14.8356bdcbc7be
pkgrel=1
pkgdesc="Useful small-space widgets for my X11 desktop"
arch=('i686' 'x86_64')
url="https://github.com/diresi/1px"
license=('MIT')
groups=()
depends=('cairo' 'libxfixes' 'libx11')
makedepends=('git' 'meson' 'gcc')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
gitname=master
source=('git+https://github.com/diresi/1px.git')
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}"
    (cd bat && \
        meson builddir && \
        meson compile -C builddir)
}

package() {
	cd "$srcdir/${pkgname%-git}"
    install -s -p bat/builddir/1pxbat -D "$pkgdir"/usr/bin/1pxbat
}
