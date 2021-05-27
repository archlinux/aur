# Maintainer: Vojtech Kral ❬vojtech%kral.hk❭

pkgname=bard
pkgver=1.1.0
pkgrel=1
pkgdesc="Creates PDF and HTML songbooks out of easy-to-write Markdown sources."
arch=('x86_64')
url="https://github.com/vojtechkral/bard"
license=('Apache-2.0')
depends=()
optdepends=('texlive-bin: TeX engine (generate PDFs) '
            'tectonic: Alternative TeX engine (generate PDFs) ')
source=("$pkgname-$pkgver.tar.gz::https://github.com/vojtechkral/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('05011671d8bce6436985cd34d73ffb2c4c8980bf3a4b8891cd5dd07df4176705')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked
}

check() {
  cd "$pkgname-$pkgver"
  cargo test --release --locked
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm 755 target/release/${pkgname} -t "${pkgdir}/usr/bin"
}
