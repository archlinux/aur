# Maintainer: Kieran Colford <kieran@kcolford.com>
pkgname=pam-cryptsetup-git # '-bzr', '-git', '-hg' or '-svn'
pkgver=r6.bf0d1ba
pkgrel=1
pkgdesc="A PAM module that allows LUKS-based disk encryption passwords to be kept in sync with account passwords."
arch=('x86_64' 'i386')
url="https://github.com/google/pam-cryptsetup"
license=('Apache')
groups=()
depends=('pam' 'cryptsetup' 'glib2')
makedepends=('git') # 'bzr', 'git', 'mercurial' or 'subversion'
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=('git+https://github.com/google/pam-cryptsetup')
md5sums=('SKIP')
noextract=()

# Please refer to the 'USING VCS SOURCES' section of the PKGBUILD man page for
# a description of each element in the source array.

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	# printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	./autogen.sh
	./configure --prefix=/usr
	make
}

check() {
	cd "$srcdir/${pkgname%-git}"
	make check
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make DESTDIR="$pkgdir/" install
}
