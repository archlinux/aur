# Maintainer: Manuel Coenen <manuel dot coenen at gmail dot com>
pkgname=getpgid-git
pkgver=r6.52e1da9
pkgrel=1
pkgdesc="Executable around the gepgid(2) system call to get Process Group ID"
arch=('any')
url="https://github.com/wilriker/getpgid"
license=('MIT')
depends=('glibc>=2.12')
makedepends=('git'
'gcc'
'make') # 'bzr', 'git', 'mercurial' or 'subversion'
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+git://github.com/wilriker/getpgid.git")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname}"
	make
}

package() {
	cd "$srcdir/${pkgname}"

  mkdir -p ${pkgdir}/usr/bin
	make DESTDIR=$pkgdir install

  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
