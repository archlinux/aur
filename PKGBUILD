#Maintainer: Nguyễn Trương Nhật Hào <nguyentruongnhathao1922@gmail.com>
pkgname='anyquery-git'
pkgver=0.4.4.r0.g0abd460 
pkgrel=1
pkgdesc="Query anything (GitHub, Notion, +40 more) with SQL and let LLMs (ChatGPT, Claude) connect to using MCP"
arch=('x86_64')
url="https://github.com/julien040/anyquery"
license=('AGPL-3.0-or-later')
depends=('glibc' 'sqlite')
makedepends=('git' 'go' 'sqlite') 
source=("$pkgname::git+$url.git") 
sha256sums=('SKIP')


pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}


build() {
  cd "$pkgname" 
  go build -ldflags="-s -w" -trimpath -tags sqlite_vtable  -o anyquery .
}


package() {
  cd "$pkgname"

  install -Dm755 "anyquery" "$pkgdir/usr/bin/anyquery"

  install -Dm644 "LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}

