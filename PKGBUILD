# Maintainer: gomanager <gomanager@generated>
pkgname=pep-ebook
pkgver=1.0.10
pkgrel=2
pkgdesc="📚自动下载带书签的电子书(人民教育教出版社)"
arch=('x86_64' 'aarch64')
url="https://github.com/maogou/pep-ebook"
license=('MIT')
depends=('glibc')
makedepends=('go' 'git')
source=("git+https://github.com/maogou/pep-ebook.git#tag=v$pkgver")
sha256sums=('SKIP')

build() {
  cd "$pkgname" || exit
  go build \
    -trimpath \
    -mod=readonly \
    -modcacherw \
    -ldflags='-s -w' \
    -o $pkgname \
    .
}

package() {
  cd "$pkgname" || exit
  install -Dm 755 $pkgname -t "$pkgdir/usr/bin"
  install -Dm 644 LICENSE.md -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
