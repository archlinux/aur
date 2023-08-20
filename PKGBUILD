# Maintainer: Antony Kellermann <antony@aokellermann.dev>

pkgname=sway-scratch
pkgver=0.1.0
pkgrel=1
pkgdesc='Automatically starting named scratchpads for sway'
arch=('x86_64')
url='https://github.com/aokellermann/sway-scratch'
license=('MIT')
depends=(glibc gcc-libs)
makedepends=(git cargo)
optdepends=('sway: sway support'
            'i3-wm: i3 support')
_tag=dfaea9d0e2bdd57bd6c2cefe39c8859da2b332b3 # git rev-parse v${pkgver}
source=("${pkgname}::git+${url}?signed#tag=${_tag}")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname}
  git describe --tags | sed 's/^v//'
}

build() {
  cd ${pkgname}
	cargo build --release
}

package() {
  install -Dm755 ${srcdir}/${pkgname}/target/release/${pkgname} -t "${pkgdir}"/usr/bin/
  install -Dm644 ${srcdir}/${pkgname}/LICENSE -t "${pkgdir}"/usr/share/licenses/${pkgname}/
}
