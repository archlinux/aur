# Maintainer: Thomas Weißschuh <thomas t-8ch de>

pkgname=lastlog2
pkgver=1.1.0
pkgrel=1
pkgdesc="Y2038 safe version of lastlog. Includes liblastlog2"
arch=('x86_64')
url="https://github.com/thkukuk/lastlog2"
license=('custom:BSD-2-Clause')
depends=('pam' 'sqlite' 'glibc')
makedepends=('meson' 'libxslt' 'docbook-xsl')
source=(
	$pkgname-$pkgver.tar.xz::https://github.com/thkukuk/lastlog2/releases/download/v$pkgver/lastlog2-$pkgver.tar.xz
)

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  arch-meson build

  meson compile -C build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  meson install -C build --destdir "$pkgdir"
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  meson test -C build
}

sha256sums=('3896fb0db3a13ecf4bc8cfc9ab89dec54383b8c35ec1b5f587de7c040085ce2b')
