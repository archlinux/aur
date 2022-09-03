# Maintainer: seth <getchoo at tuta dot io>
# Contributor: Patrick Wu <me@patrickwu.space>

pkgname=wslu
pkgver=4.0.0
pkgrel=1
pkgdesc="A collection of utilities for Windows Subsystem for Linux"
arch=(any)
url="https://wslutiliti.es/wslu"
license=('GPL3')
depends=('bc' 'imagemagick')
optdepends=('bash-completion: for CLI args completion')
install=wslu.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/wslutilities/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('f3fc0191306496e8794397ba7623754b834603fd3f37bef40a858c0fe1ac3e08')

build() {
	cd "${srcdir}/$pkgname-$pkgver"

  chmod 755 configure.sh
  ./configure.sh --build
	make
}

package() {
	cd "${srcdir}/$pkgname-$pkgver"

	make DESTDIR="${pkgdir}" install
  install -Dm0644 LICENSE -t "${pkgdir}/usr/share/licenses/wslu/"
}

# nvim: ts=2 sw=2 et:
