# Maintainer: gomanager <gomanager@generated>
pkgname=hanime-hunter
pkgver=0.3.2
pkgrel=2
pkgdesc="A CLI app to download HAnime.  用于下载里番的 CLI 工具"
arch=('x86_64' 'aarch64')
url="https://github.com/acgtools/hanime-hunter"
license=('GPL-3.0')
depends=('glibc')
makedepends=('go' 'git')
source=("git+https://github.com/acgtools/hanime-hunter.git#tag=v$pkgver")
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
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
