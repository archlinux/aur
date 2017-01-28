# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# The following guidelines are specific to BZR, GIT, HG and SVN packages.
# Other VCS sources are not natively supported by makepkg yet.

# Maintainer: Nino van der Linden (dev at ninov.de)
_pkgname=go-fonts
pkgname=$_pkgname-git
pkgver=r205.83686c5
pkgrel=1
pkgdesc="The Go font family"
arch=(any)
url="https://blog.golang.org/go-fonts"
license=('BSD')
depends=(fontconfig xorg-font-utils)
makedepends=('git') # 'bzr', 'git', 'mercurial' or 'subversion'
provides=("${_pkgname%}")
install=$pkgname.install
source=("$pkgname::git+https://go.googlesource.com/image")
md5sums=('SKIP')

# Please refer to the 'USING VCS SOURCES' section of the PKGBUILD man page for
# a description of each element in the source array.

pkgver() {
	cd "$srcdir/${pkgname}"

	# Git, no tags available
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


package() {
	cd "$srcdir/${pkgname}/font/gofont/ttfs"
	for f in *.ttf
	do
		if [[ $f =~ ^Go-Mono.* ]]
			then install -Dm644 "$f" "$pkgdir/usr/share/fonts/Go Mono/$f"
			else install -Dm644 "$f" "$pkgdir/usr/share/fonts/Go/$f"
		fi	
	done
}
