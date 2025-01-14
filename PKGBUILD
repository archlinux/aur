pkgname=crun-vm
pkgver=0.3.0
pkgrel=1
pkgdesc="Run VM disk images using Podman / Docker / Kubernetes"
arch=('x86_64')
url="https://github.com/containers/crun-vm"
license=('GPL-2.0')
depends=('libselinux')
makedepends=('ruby-ronn-ng' 'rust')
source=("git+https://github.com/containers/crun-vm.git#tag=$pkgver")
sha512sums=('be84e0b79587baf6ff91cecbac96d8b705a8f2dd084262af4b3b5ffcd43c9066746ea92e53b3c0f2a4a8408db5853fa366e6cc12ba58ef3c482d3615e6d030ae')
build() {
  cd $pkgname
  cargo build --release
  ronn --pipe --roff docs/5-crun-vm.1.ronn > docs/crun-vm.1
}

package() {
  cd $pkgname
  install -Dm755 target/release/crun-vm $pkgdir/usr/local/bin/crun-vm
  install -Dm644 docs/crun-vm.1 $pkgdir/usr/local/man/man1/crun-vm.1
}