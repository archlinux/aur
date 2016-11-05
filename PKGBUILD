# Maintainer: Jonathon Fernyhough <jonathon@manjaro.org>

pkgname=hyperstart
pkgver=0.7.0
pkgrel=1
pkgdesc="Hypervisor-agnostic Docker Runtime (boot files)"
arch=('any')
url="https://www.hypercontainer.io/"
license=('Apache')
makedepends=('go')
optdepends=('hyperd: Hypervisor-agnostic Docker Runtime')
options=('!strip' '!emptydirs')
source=("hyperstart-$pkgver.tar.gz::https://github.com/hyperhq/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('e85efb735e3cd14cc10d6a910bfd1393614a5e197415ac227777141a48d5591e')

build() {
  cd "${pkgname}-${pkgver}"

  ./autogen.sh
  ./configure --prefix=/usr --with-vbox
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  
  install -D -m644 build/hyper-initrd.img "${pkgdir}/var/lib/hyper/hyper-initrd.img"
  install -D -m644 build/hyper-vbox-boot.iso "${pkgdir}/var/lib/hyper/hyper-vbox-boot.iso"
  install -D -m644 build/kernel "${pkgdir}/var/lib/hyper/kernel"
}
