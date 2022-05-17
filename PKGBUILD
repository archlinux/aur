# Contributor: Roey Darwish Dror <roey.ghost@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=topgrade-git
pkgver=9.0.0
pkgrel=1
pkgdesc='Invoke the upgrade procedure of multiple package managers'
arch=('x86_64' 'aarch64' 'armv7')
url='https://github.com/r-darwish/topgrade'
license=('GPL3')
depends=('gcc-libs')
makedepends=('rust' 'git')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  git describe --tags | sed 's+-+.r+' | cut -c2- | tr - .
}

build() {
  cd ${pkgname%-git}
  cargo build --release --locked
}

package() {
  cd ${pkgname%-git}

  install -Dm755 target/release/${pkgname%-git} "$pkgdir"/usr/bin/${pkgname%-git}
  install -Dm644 ${pkgname%-git}.8 "$pkgdir"/usr/share/man/man8/${pkgname%-git}.8
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
