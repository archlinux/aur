# Maintainer: Antoine Viallon <antoine+aur@lesviallon.fr>
pkgname=pdfjam-extras
pkgdesc="Wrappers around pdfjam useful for merging, selecting pages, etc. one or more PDF documents"
pkgver=r12.622e03a
pkgrel=1
arch=("any")
source=("git+https://github.com/rrthomas/pdfjam-extras.git")
md5sums=('SKIP')
depends=("texlive-core")

pkgver() {
  cd "$pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
	mkdir -p "${pkgdir}/usr/bin"
	mkdir -p "${pkgdir}/usr/share/man/man1"
	install -v -m755 "${srcdir}/${pkgname}"/bin/* "${pkgdir}/usr/bin/"
	install -v -m644 "${srcdir}/${pkgname}"/man1/* "${pkgdir}/usr/share/man/man1"
}

