# Maintainer: Vincent Bernardoff <vb AT luminar.eu.org>
pkgname=mmc-utils-git
pkgver=b4fe0c8.dirty
pkgrel=1
pkgdesc="Userspace tools for MMC/SD devices"
arch=(arm armv6h armv7h aarch64 x86_64 i686)
url="https://git.kernel.org/pub/scm/linux/kernel/git/cjb/mmc-utils.git"
license=('GPL')
depends=()
makedepends=('git' 'make')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
install=
source=('git://git.kernel.org/pub/scm/linux/kernel/git/cjb/mmc-utils.git'
        'lsmmc.patch')
noextract=()
sha256sums=('SKIP'
            '169a9f6edb8deef993cf4f663eaca4f934d8c4b9ba308ada3300ea02a12f2281')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    git describe --always --dirty --tags | sed -e 's/-/./g'
}

prepare() {
    cd "${pkgname%-git}"
    patch -p1 < ../lsmmc.patch
}

build() {
    cd "${pkgname%-git}"
    make all
}

# check() {
# }

package() {
    cd "${pkgname%-git}"
    make DESTDIR="$pkgdir/" prefix=/usr install
    install -D man/mmc.1 "$pkgdir/usr/share/man/man1/mmc.1"
}
