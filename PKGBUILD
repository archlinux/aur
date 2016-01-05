pkgname=riscv-fesvr-git # '-bzr', '-git', '-hg' or '-svn'
pkgver=r181.0f34d7a
pkgrel=1
pkgdesc="RISC-V Frontend Server"
arch=(x86_64 i686)
url="https://github.com/riscv/riscv-fesvr"
license=('BSD')
groups=()
depends=()
makedepends=('git') # 'bzr', 'git', 'mercurial' or 'subversion'
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=('git+https://github.com/riscv/riscv-fesvr')
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
