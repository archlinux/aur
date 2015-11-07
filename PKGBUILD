# Maintainer: Stephen Brennan <smb196@case.edu>
pkgname=libcommuni-git # '-bzr', '-git', '-hg' or '-svn'
pkgver=r1647.780dcdc
pkgrel=1
pkgdesc="A cross-platform IRC framework written with Qt."
arch=('x86_64' 'i686')
url="https://communi.github.io/"
license=('custom')
groups=()
depends=('qt5-declarative')
makedepends=('git') # 'bzr', 'git', 'mercurial' or 'subversion'
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=('git://github.com/communi/libcommuni')
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}"
        qmake
        make
}

check() {
	cd "$srcdir/${pkgname%-git}"
	make -k check
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make INSTALL_ROOT="$pkgdir/" install
        mkdir -p "$pkgdir/usr/share/licenses/${pkgname}/"
        install -m644 LICENSE \
                "$pkgdir/usr/share/licenses/${pkgname}/"
}
