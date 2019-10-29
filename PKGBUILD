# Maintainer: Eduard Tolosa <edu4rdshl@protonmail.com>

pkgname=findomain-git
_pkgname=findomain
pkgver=316.fdb95ac
pkgrel=1
pkgdesc='The fastest and cross-platform subdomain enumerator, do not waste your time.'
arch=('any')
groups=('blackarch' 'blackarch-scanner' 'blackarch-recon')
url='https://github.com/Edu4rdSHL/findomain'
license=('GPL3')
optdepends=('postgresql: for subdomains monitoring.')
makedepends=('git' 'cargo')
source=("git+https://github.com/Edu4rdSHL/$_pkgname.git")
sha512sums=('SKIP')

pkgver() {
  cd $_pkgname

  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
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

