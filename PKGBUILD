# Maintainer: PAPPY <pappy _AT_ a s c e l i o n _DOT_ com>

pkgname=kool
pkgver=1.12.1
pkgrel=2
pkgdesc="Kool makes using Docker for local development easier, simpler, faster, and better"
arch=(x86_64 armv6h armv7h)
url=https://kool.dev
license=('MIT')
provides=(kool)
depends=(docker-compose)
options=('!emptydirs' '!strip')

source=("kool-$pkgver-x86_64::https://github.com/kool-dev/kool/releases/download/$pkgver/kool-linux-amd64")
source_armv6h=("kool-$pkgver-armv6h::https://github.com/kool-dev/kool/releases/download/$pkgver/kool-linux-arm6")
source_armv7h=("kool-$pkgver-armv7h::https://github.com/kool-dev/kool/releases/download/$pkgver/kool-linux-arm7")

sha256sums=('5f7ded49a6fde4121725dbfb03c2e080cce3fb19a79e19ba8ed4829c25e4b841')
sha256sums_armv6h=('531b4dc5ff4223e4555fed9eb717462b82b3d08f628fcc70d8379be8ddbb15f8')
sha256sums_armv7h=('36b0bb0f76997cf11f90c797d52348988a359e6d141459eafb338de95e17db6d')

package() {
	cd $srcdir

	install -Dm755 kool-$pkgver-$arch $pkgdir/usr/bin/kool

	install -dm755 $pkgdir/usr/share/bash-completion/completions
	$pkgdir/usr/bin/kool completion bash >$pkgdir/usr/share/bash-completion/completions/kool

	install -dm755 $pkgdir/usr/share/zsh/site-functions
	$pkgdir/usr/bin/kool completion zsh >$pkgdir/usr/share/zsh/site-functions/_kool
}
