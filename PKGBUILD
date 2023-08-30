# Maintainer: tarball <bootctl@gmail.com>
# Contributor: Árni Dagur <arnidg@protonmail.ch>

pkgname='xcp'
pkgver='0.12.0'
pkgrel=1
pkgdesc="An extended 'cp'"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url='https://github.com/tarka/xcp'
license=('GPL3')
depends=('glibc' 'gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz" xcp.bash)
sha512sums=('d62583843714bbda0287c33ee52955ed1d09a19010e6b09b5095818ff3ef7b8c0b73ed033aaecb766d9868db22108a3eddc1792e49b22f912dfaaeb283496a2f'
            'e8c8a91d8fee9dd513d461b98f41beef0c139a7de6c4dd1761629afdfe5ecd22ac05800d667ed58943debe626630401ca9fc6e1cd41faa45cbe240b71052baac')

build() {
  cd $pkgname-$pkgver
  cargo build --release --locked
}

check() {
  cd $pkgname-$pkgver
  cargo test --release --locked
}

package() {
  install -Dm644 "$srcdir/$pkgname.bash" "$pkgdir/usr/share/bash-completion/completions/$pkgname"
  install -Dm755 "$pkgname-$pkgver/target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
