# Maintainer: Alex Henrie <alexhenrie24@gmail.com>
pkgname=mkosxinstallusb-git
pkgver=r16.d90985d
pkgrel=1
pkgdesc="Creates bootable USB flash drive with OS X installer"
arch=('any')
url='https://github.com/eprigorodov/mkosxinstallusb'
license=('apache')
groups=()
depends=('dash' 'dmg2img' 'gdisk' 'hfsprogs' 'multipath-tools' 'parted' 'rsync' 'util-linux')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=('git+https://github.com/eprigorodov/mkosxinstallusb.git'
        'mkosxinstallusb.patch')
noextract=()
sha256sums=('SKIP' 'SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/${pkgname%-git}"
	patch -p1 -i "$srcdir/${pkgname%-git}.patch"
}

package() {
	cd "$srcdir/${pkgname%-git}"
	install -Dm755 mkosxinstallusb.sh "$pkgdir/usr/bin/mkosxinstallusb"
}
