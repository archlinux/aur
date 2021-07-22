# Maintainer: Vojtech Kral ❬vojtech%kral.hk❭

pkgname=bard
pkgver=1.2.1
pkgrel=1
pkgdesc="Creates PDF and HTML songbooks out of easy-to-write Markdown sources."
arch=('x86_64')
url="https://github.com/vojtechkral/bard"
license=('Apache-2.0')
depends=()
optdepends=('texlive-bin: TeX engine (generate PDFs) '
            'tectonic: Alternative TeX engine (generate PDFs) ')
source=("$pkgname-$pkgver.tar.gz::https://github.com/vojtechkral/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('184d26af07e5f968494810a3bff2823e0158028ea25d1c3178b851f38ef6a1d4')

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
