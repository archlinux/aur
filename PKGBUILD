# Maintainer: Sebastiaan de Schaetzen <sebastiaan.de.schaetzen@gmail.com>
pkgname=nas-git # '-bzr', '-git', '-hg' or '-svn'
pkgver=r219.f1e8e0d
pkgrel=1
pkgdesc="Network Audio System is a network transparent, client/server audio transport system. Provides libaudio2.so."
arch=('i686' 'x86_64')
url="http://radscan.com/nas.html"
license=('MIT')
depends=('libxaw')
makedepends=('git' 'imake' 'bison' 'flex') # 'bzr', 'git', 'mercurial' or 'subversion'
provides=("libaudio2")
conflicts=("libaudio2")
source=('nas::git+https://git.code.sf.net/p/nas/nas.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	xmkmf
	make World
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make install DESTDIR="$pkgdir/" USRLIBDIR=/usr/lib LDLIBS=-lfl
}
