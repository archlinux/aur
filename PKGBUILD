# Maintainer: yuki_wastaken <yukiat at proton dot me>
pkgname=catnip-git
_pkgname=catnip
pkgver=r208.b3f93a9
pkgrel=2
pkgdesc="A minimalistic and fast system fetch written in Nim."
arch=(x86_64)
url="https://github.com/iinsertNameHere/catnip"
license=('MIT')
groups=()
depends=('openssl' 'pcre' 'glibc')
makedepends=('git' 'nim')
source=('git+https://github.com/iinsertNameHere/catnip.git')
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
}

package() {
	cd "${_pkgname%}"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm755 bin/catnip "$pkgdir/usr/local/bin/${_pkgname}"
  install -Dm644 docs/catnip.1 "$pkgdir/usr/share/man/man1/catnip.1"
  }
