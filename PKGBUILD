# Maintainer: Vojtech Kral ❬vojtech%kral.pm❭

pkgname=bard
pkgver=2.0.1
pkgrel=1
pkgdesc="Creates PDF and HTML songbooks out of easy-to-write Markdown sources."
arch=('x86_64')
url="https://github.com/vojtechkral/bard"
license=('Apache-2.0')
depends=()
optdepends=('texlive-bin: TeX engine (generate PDFs) '
            'tectonic: Alternative TeX engine (generate PDFs) ')
source=("$pkgname-$pkgver.tar.gz::https://github.com/vojtechkral/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('4d6e56d68b493685b175bc10354926416e9b7497ab3707d115cee9768cd6fb73')

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
	install -Dm 755 "target/release/${pkgname}" -t "${pkgdir}/usr/bin"
}
