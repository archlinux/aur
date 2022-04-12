# Maintainer: Eduard Tolosa <edu4rdshl@protonmail.com>

pkgname=findomain-git
_pkgname=findomain
pkgver=826.8f00eac
pkgrel=1
pkgdesc='The fastest and cross-platform subdomain enumerator, do not waste your time.'
arch=('any')
url='https://github.com/Edu4rdSHL/findomain'
license=('GPL3')
optdepends=('postgresql: for subdomains monitoring.')
depends=('gcc-libs')
makedepends=('git' 'cargo')
source=("git+https://github.com/Edu4rdSHL/$_pkgname.git")
sha512sums=('SKIP')
options=(!lto)

pkgver() {
  cd $_pkgname

  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

check() {
  cd ${_pkgname}-${pkgver}

  cargo test --release --locked
}

build() {
  cd $_pkgname

  cargo build --release --locked
}

package() {
  cd $_pkgname

  install -Dm 755 "target/release/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -Dm 644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
  install -Dm 644 -t "$pkgdir/usr/share/man/man1/" $_pkgname.1
}

