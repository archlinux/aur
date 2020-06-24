# Maintainer: Simon Paul <simonpaul@mailbox.org>

pkgname=twad-git
_pkgname=twad
pkgver=0.6.2
pkgrel=1
pkgdesc='Terminal wad launcher'
arch=('any')
url="https://github.com/zmnpl/twad"
license=('MIT')
makedepends=('go' 'git')
source=("git+https://github.com/zmnpl/twad.git")
sha256sums=('SKIP')

pgkver() {
	cd "${srcdir}"/${_pkgname}
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}"/${_pkgname}
  go build \
    -trimpath \
    -ldflags "-extldflags $LDFLAGS" \
    -o $pkgname .
}

package() {
  cd "${srcdir}"/${_pkgname}
  install -Dm755 $pkgname "$pkgdir"/usr/bin/$_pkgname
  install -Dm644 "${srcdir}/${_pkgname}"/LICENSE     "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
