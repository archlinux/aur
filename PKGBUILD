# Maintainer: Simon Paul <simonpaul@mailbox.org>

pkgname=twad-git
_pkgname=twad
pkgver=0.20.3
pkgrel=1
pkgdesc='Manage DOOM engines and mods with the terminal wad launcher'
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
  git checkout v0.20.0
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
