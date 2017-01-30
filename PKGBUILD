# Maintainer: Chris Marsh <chris.pm@gmail.com>

pkgname=galendae-git
pkgver=r32.e0e5c02
pkgrel=1
pkgdesc="A basic popup calendar that can be styled to match workspace themes"
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
  install -d "$pkgdir"/usr/{bin,share/galendae/examples}
  install -m755 galendae "$pkgdir"/usr/bin/
  install -m644 examples/* "$pkgdir"/usr/share/galendae/examples/
  install -m644 galendaerc "$pkgdir"/usr/share/galendae/examples/
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
