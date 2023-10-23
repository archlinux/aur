pkgname=dura-git
_pkgname=dura
pkgver=v0.2.0.r11.gb4a51b9
pkgrel=1
pkgdesc='Dura is a background process that watches your Git repositories and commits your uncommitted changes'
arch=(x86_64)
url=https://github.com/tkellogg/dura
commit=88ab59bb869b7b7d6a908d6dcbdadc5199ac92af
license=(Apache)
makedepends=(git cargo)
provides=(dura)
source=(git+$url#commit=$commit)
sha512sums=('SKIP')

build() {
  cd $_pkgname
  cargo build --locked --release
}

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd $_pkgname
  install -D target/release/dura -t "$pkgdir"/usr/bin
}

