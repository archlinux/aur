# Maintainer: Nis Donatzsky Hansen <nis at donatzsky dot eu>

pkgname=marco-suite
pkgver=0.23.2
pkgrel=1
pkgdesc="Marco & Polo: Markdown composer and viewer"
arch=('x86_64')
url="https://github.com/Ranrar/Marco"
license=('MIT')
depends=('gtk4' 'gtksourceview5' 'webkitgtk-6.0')
makedepends=('cargo')
source=("https://github.com/Ranrar/Marco/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('f521feb0071b4c4506ff4f729ea2a81f5bd5442dca7b59982de75b97820b2a79c3e7751116f03eee22e77b466dbae8e3844d24351e205cbfad49bc4c07e44b8f')
options=(!lto)

build() {
  cd "Marco-$pkgver"

  cargo build --release
}


package() {
  cd "Marco-$pkgver"

  install -Dm755 "target/release/marco" "${pkgdir}/usr/bin/marco"
  install -Dm755 "target/release/polo" "${pkgdir}/usr/bin/polo"

  install -Dm644 "build/linux/marco.desktop" "${pkgdir}/usr/share/applications/marco.desktop"
  install -Dm644 "build/linux/polo.desktop" "${pkgdir}/usr/share/applications/polo.desktop"

  install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" documentation/user_guide/*
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
