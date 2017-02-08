# Maintainer: Chris Marsh <chris.pm@gmail.com>

pkgname=galendae-git
pkgver=r42.2c6e713
pkgrel=1
pkgdesc="A lightweight popup calendar that can be styled to match workspace themes"
arch=('i686' 'x86_64')
url="https://github.com/chris-marsh/galendae"
license=('MIT')
depends=('gtk3')
makedepends=('git')
source=("git+https://github.com/chris-marsh/galendae.git")
md5sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd ${pkgname%-git}
  make release
}

package() {
  cd ${pkgname%-git}
  install -d "$pkgdir"/usr/{bin,share/galendae/config}
  install -m755 galendae "$pkgdir"/usr/bin/
  install -m644 config/* "$pkgdir"/usr/share/galendae/config/
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
