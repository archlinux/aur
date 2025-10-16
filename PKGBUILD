# Maintainer: Oliver Ladner <waste@lugh.ch>
pkgname=fortune-mod-dune
pkgver=2.0.1
pkgrel=1
pkgdesc="Quotes from Frank Herbert's 'Dune' series"
arch=('any')
url='https://github.com/agoodno/fortune-dune'
license=('unknown')
groups=('fortune-mods')
depends=('fortune-mod')
# git rev-parse $pkgver
_tag='66f5360604c7a9c0e2b59e78c6d00e27092816b8'
source=($pkgname::git+$url.git?#tag=$_tag)
# updpkgsums
sha256sums=('192024646acaa841f5dd36212398132994355a87bf85a3d6b65c21309bdf91a6')

build() {
	cd "$srcdir/$pkgname"
    # Filter for files in lower case and not ending in .sh
    _fortune_files="$(ls -1 -I "[A-Z]*" -I "*.sh")"
	for f in $_fortune_files; do
        strfile "$f"
    done
}

package() {
	cd "$srcdir/$pkgname"
    install -dm755 -- "${pkgdir}/usr/share/fortune"
    # Filter for files in lower case and not ending in .sh
    _fortune_files="$(ls -1 -I "[A-Z]*" -I "*.sh")"
	for f in $_fortune_files; do
        # install -m644 -- ${f} ${f}.dat "${pkgdir}/usr/share/fortune"
        install -m644 -- $f "${pkgdir}/usr/share/fortune"
        # install -m644 -- $f.dat "${pkgdir}/usr/share/fortune"
    done
}
