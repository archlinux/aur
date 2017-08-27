
# Maintainer: Jan Frederick Eick <jan-frederick.eick@uni-weimar.de>
pkgname=beefi-git
pkgver=r11.cb62a98
pkgrel=1
pkgdesc="a bootable EFISTUB kernel image creator (for UEFI systems)"
arch=(any)
url="https://github.com/jfeick/beefi.git"
license=('GPL')
groups=()
depends=("binutils")
makedepends=('git') 
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=('etc/beefi/beefi.conf' 'etc/pacman.d/hooks/beefi.hook')
options=()
install=beefi.install
source=('git+https://github.com/jfeick/beefi.git')
noextract=()
md5sums=('SKIP')


pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/${pkgname%-git}"
}


package() {
	cd "$srcdir/${pkgname%-git}"
    install -D -g 0 -o 0 -m 755 beefi "${pkgdir}/usr/bin/beefi"
    install -D -g 0 -o 0 -m 0644 beefi.1 "${pkgdir}/usr/share/man/man1/beefi.1"
    gzip "${pkgdir}/usr/share/man/man1/beefi.1"
    install -D -g 0 -o 0 -m 0644 beefi.conf "${pkgdir}/etc/beefi/beefi.conf"
    install -D -g 0 -o 0 -m 0644 beefi.hook "${pkgdir}/etc/pacman.d/hooks/beefi.hook"
}

