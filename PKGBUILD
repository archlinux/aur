# Maintainer: <thysupremematrix@tuta.io>
pkgname=numix-tools-git
pkgver=r56.a63bf0c
pkgrel=1
pkgdesc="Various tools and scripts used by the Numix Project"
arch=(any)
url="https://github.com/numixproject/numix-tools"
license=("GPL3")
depends=()
makedepends=('git')
optdepends=(
	"librsvg: For svgscale"
	"svgcleaner: For svgclean [AUR package]"
)
source=("git+https://github.com/numixproject/numix-tools.git")
sha256sums=('SKIP')
_gitname=$(echo $pkgname | sed "s/\-git//g")

pkgver() {
	cd $srcdir/$_gitname
	( set -o pipefail
    		git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
	    	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
 	 )
}


package(){
	cd $srcdir/$_gitname/$_gitname
	for i in $(ls | grep ^svg); do
		install -Dm577 $i $pkgdir/usr/bin/$i
	done

	cd $srcdir/$_gitname
	install -Dm644 README.md $pkgdir/usr/share/doc/$pkgname/README.md
}
