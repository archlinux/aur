_pkgname=unity-version-manager
pkgname=${_pkgname}-git
pkgver=uvm.install2.v0.4.1.r0.gb52fc66
pkgrel=1
pkgdesc='cli utility to install and manager unity versions'
arch=(x86_64)
url='https://github.com/Larusso/unity-version-manager'
license=('Apache')
depends=(p7zip)
makedepends=(cargo git)
provides=('unity-version-manager')
conflicts=('unity-version-manager')
source=("git+https://github.com/Larusso/unity-version-manager.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "%s" "$(git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g')"
}

build() {
  cd $_pkgname
  cargo build --release --all
}

package() {
  cd $_pkgname
  cargo install --path ./commands/uvm --root "$pkgdir"/usr
  cargo install --path ./commands/uvm-commands --root "$pkgdir"/usr
  cargo install --path ./commands/uvm-detect --root "$pkgdir"/usr
  cargo install --path ./commands/uvm-download-manifest --root "$pkgdir"/usr
  cargo install --path ./commands/uvm-fix-modules-json --root "$pkgdir"/usr
  cargo install --path ./commands/uvm-generate-modules-json --root "$pkgdir"/usr
  cargo install --path ./commands/uvm-help --root "$pkgdir"/usr
  cargo install --path ./commands/uvm-launch --root "$pkgdir"/usr
  cargo install --path ./commands/uvm-list --root "$pkgdir"/usr
  cargo install --path ./install/uvm-install --root "$pkgdir"/usr
  cargo install --path ./install/uvm-modules --root "$pkgdir"/usr
  cargo install --path ./install/uvm-install2 --root "$pkgdir"/usr
  cargo install --path ./install/uvm-uninstall --root "$pkgdir"/usr
  cargo install --path ./install/uvm-versions --root "$pkgdir"/usr
}
