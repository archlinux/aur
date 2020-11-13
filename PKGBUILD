# Maintainer: Christoph Rissner <resi@rissner.net>
pkgbase=1px
pkgname=${pkgbase}-git
pkgver=r18.6b4431f435a5
pkgrel=1
pkgdesc="Useful small-space widgets for my X11 desktop (battery level)"
arch=('i686' 'x86_64')
url="https://github.com/diresi/1px"
license=('MIT')
groups=()
depends=('cairo' 'libxfixes' 'libx11')
makedepends=('git' 'meson')
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
    install -m 0644 -p LICENSE -D "$pkgdir"/usr/share/licenses/${pkgname}/LICENSE
}
