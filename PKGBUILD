# Maintainer: David Thurstenson <thurstylark@gmail.com>
pkgname=mmdvmhost-git
pkgver=r2193.f71c8ce
pkgrel=2
pkgdesc="The host program for the MMDVM"
arch=('x86_64' 'i686')
url="https://github.com/g4klx/MMDVMHost"
license=('GPL2')
depends=()
makedepends=('git') # 'bzr', 'git', 'mercurial' or 'subversion'
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
install=mmdvmhost.install
source=('mmdvmhost::git+https://github.com/g4klx/MMDVMHost.git')
md5sums=('SKIP')
backup=('etc/MMDVM.ini')

pkgver() {
	cd "$srcdir/${pkgname%-git}"

# Git, no tags available
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	make all
}

package() {
	cd "$srcdir/${pkgname%-git}"

	install -Dm 755 MMDVMHost "${pkgdir}/usr/bin/MMDVMHost"
	install -Dm 755 RemoteCommand "${pkgdir}/usr/bin/RemoteCommand"
	install -Dm 600 MMDVM.ini "${pkgdir}/etc/MMDVM.ini"
}
