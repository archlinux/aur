# Maintainer: yuki_wastaken <yukiat at proton dot me>
pkgname=catnap-git
_pkgname=catnap
pkgver=r289.c6f9523
pkgrel=1
pkgdesc="A minimalistic and fast system fetch written in Nim."
arch=('x86_64' 'aarch64')
url="https://github.com/iinsertNameHere/catnap"
license=('MIT')
groups=()
depends=('openssl' 'pcre' 'glibc')
makedepends=('git' 'nim')
source=('git+https://github.com/iinsertNameHere/catnap.git')
conflicts=($_pkgname)
provides=($_pkgname)
sha256sums=('SKIP')

pkgver() {
	cd "${_pkgname%}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${_pkgname%}"
	nim release
  nim install_cfg
}

package() {
	cd "${_pkgname%}"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm755 bin/catnap "$pkgdir/usr/bin/${_pkgname}"
  install -Dm644 docs/catnap.1 "$pkgdir/usr/share/man/man1/catnap.1"
  install -Dm644 docs/catnap.5 "$pkgdir/usr/share/man/man5/catnap.5"
  }
