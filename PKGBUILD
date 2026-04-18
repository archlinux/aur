# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.
# Maintainer: Franciszek Żebrowski <frazeb09@gmail.com>
pkgname=tuiweather
pkgver=1.0.0
pkgrel=1
epoch=
pkgdesc="Simple TUI app for showing weather"
arch=('x86_64')
url="https://github.com/Detalexpl/TuiWeather"
license=('MIT')
groups=()
depends=('gcc-libs' 'glibc')
makedepends=('cargo')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
noextract=()
sha256sums=('d79c1ed3e8858809146ecb0cd5e565981a3900c89ed558866d6cc60f9f1688fd')
validpgpkeys=()


prepare() {
  cd "$srcdir"/"TuiWeather-$pkgver" || cd "$srcdir"/*
  
  cargo fetch --locked --target "$(rustc -vV | sed -n 's|host: ||p')"
}


build() {
  cd "TuiWeather-$pkgver"
  cargo build --frozen --release --all-features
}

check() {
  cd "TuiWeather-$pkgver"
  cargo test --frozen --workspace
}
package() {
  cd "TuiWeather-$pkgver"
  # Instaluje plik wykonywalny do /usr/bin/
  install -Dm755 "target/release/TuiWeather" "$pkgdir/usr/bin/TuiWeather"
  
  # Instaluje licencję (wymagane w Archu, jeśli to np. MIT)
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

