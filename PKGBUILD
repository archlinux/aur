# Maintainer: Frederik “Freso” S. Olesen <archlinux@freso.dk>
pkgname=unipicker
pkgver=2.0.0
pkgrel=1
pkgdesc='CLI utility for searching unicode characters by description and copy them to the clipboard'
arch=('any')
url="https://github.com/jeremija/$pkgname"
license=('MIT')
depends=('bash')
makedepends=('python')
optdepends=('fzf: selector command'
            'xclip: for copying to clipboard')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
        "$pkgname-Makefile.patch::$url/pull/2.patch")
sha512sums=('bfa4241d16e613218d2eb3fe4dc6dbb19ec4f27492da4947eb031418a98ee67b681e3016493865bf1b327c30cb951a6ed3212acadd1ad6c3b4ce62d6e6093cb3'
            '2d767c4d65f8d7ba1daad113d46b1dfd7842f1d7948b5c9ea7c59b806e32fab33101bed23684916812dbb1747d977118a412d6a76152f8ae65e6a5dc34d45717')

prepare() {
	cd "$pkgname-$pkgver"
	patch < "$srcdir/$pkgname-Makefile.patch"
	sed -i -E 's|/usr/local/share|/usr/share|' unipickerrc
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install PREFIX="$pkgdir/usr"
	install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
