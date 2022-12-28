# Maintainer: not_anonymous <nmlibertarian@gmail.com>
# Contributor: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: Kenneth Endfinger <kaendfinger@gmail.com>

pkgname=addinclude-git
_pkgname=addinclude
_authorname=xyproto
pkgver=1.2.0
#.r5.g4997fa0
#.r1.g9d6e3c8
pkgrel=1
pkgdesc='Add include statements to header and sourcefiles, for C and C++'
arch=(x86_64)
url='https://github.com/xyproto/addinclude'
license=(GPL2)
makedepends=('go' 'git')
provides=(addinclude)
conflicts=(addinclude)
source=("${_pkgname}::git+https://github.com/${_authorname}/${_pkgname}.git#branch=main")

pkgver() {
        cd "${_pkgname}"

        git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd $srcdir/$_pkgname
	go build -v -mod=vendor -trimpath -buildmode=pie -ldflags="-s -w -extldflags \"${LDFLAGS}\""
}

package() {
	cd $srcdir/$_pkgname
	install -Dm755 $_pkgname "$pkgdir/usr/bin/$_pkgname"
	install -Dm644 $_pkgname.1 "$pkgdir/usr/share/man/man1/$_pkgname.1"
}
md5sums=('SKIP')
sha256sums=('SKIP')
