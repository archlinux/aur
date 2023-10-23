pkgname=dura-git
pkgver=v0.2.0.r11.gb4a51b9
pkgrel=1
pkgdesc='Dura is a background process that watches your Git repositories and commits your uncommitted changes'
arch=(x86_64)
url=https://github.com/tkellogg/dura
license=(Apache)
makedepends=(git cargo)
provides=(dura)
source=("${pkgname}::git+${url}")
sha512sums=('SKIP')

build() {
  cd $pkgname
  cargo build --locked --release
}

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd $pkgname
  install -D target/release/dura -t "$pkgdir"/usr/bin
}
