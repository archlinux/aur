# Maintainer: Paulo Matos <paulo@matos-sorge.com>
# Contributor: b4283 <unknown@unknowndomain.com>
pkgname=riscv-isa-sim-git # '-bzr', '-git', '-hg' or '-svn'
pkgver=r496.785762c
pkgrel=1
pkgdesc="Spike, a RISC-V ISA Simulator"
arch=(x86_64 i686)
url="https://github.com/riscv/riscv-isa-sim"
license=('BSD')
groups=()
depends=(riscv-fesvr-git dtc)
makedepends=('git') # 'bzr', 'git', 'mercurial' or 'subversion'
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=('git+https://github.com/riscv/riscv-isa-sim')
md5sums=('SKIP')
noextract=()

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make DESTDIR="$pkgdir/" install
}
