# Maintainer: Dmitry Chusovitin <dchusovitin@gmail.com>

pkgname=gpgpwd-git
_pkgbase=${pkgname%-git}
pkgver=0.7.2.r8.ga6fa6a1
pkgrel=2
pkgdesc='A command-line password manager based around GnuPG'
arch=('i686' 'x86_64')
url="https://gitlab.com/zerodogg/gpgpwd/"
license=('GPL3')
conflicts=($_pkgbase)
depends=('perl' 'perl-json' 'perl-try-tiny' 'gnupg')
optdepends=(
	'git: synchronize your passwords between different machines'
	'xclip: for X11 clipboard support'
	'wl-clipboard: for Wayland clipboard support'
)
source=(git+https://gitlab.com/zerodogg/gpgpwd.git)
sha256sums=('SKIP')

pkgver() {
	cd $_pkgbase
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
	cd $_pkgbase

	make man
	BINDIR=$pkgdir/usr/bin DATADIR=$pkgdir/usr/share make install

	install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
