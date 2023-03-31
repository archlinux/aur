# Maintainer: Fredrick R. Brennan <copypaste@kittens.ph>

pkgname=makepkg-cg
_ghuser=ctrlcctrlv
pkgver='0.1.0.pre'
pkgrel=1
pkgdesc="A makepkg wrapper using Control Groups via systemd.resource-control"
arch=('any')
url="https://github.com/ctrlcctrlv/makepkg-cg"
license=('Apache')
depends=('systemd' 'bash')
source=("https://github.com/$_ghuser/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('c1983fedd56034f68d695b5a1b09fdbcc3abbe2d6fae9569a48164143f612d27')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  cp doc/makepkg-cg.conf "${srcdir}/"
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # CFLAGS="" make
  
  # Install the makepkg-cg script
  install -Dm755 makepkg-cg "${pkgdir}/usr/bin/makepkg-cg"
  
  # Install the eBPF program
  # install -Dm755 makepkg-cg-prio/makepkg-cg-prio.bpf.o "${pkgdir}/usr/share/makepkg-cg/makepkg-cg-prio.bpf.o"

  # Install the makepkg-cg configuration file
  install -Dm644 "${srcdir}/makepkg-cg.conf" "${pkgdir}/usr/share/makepkg-cg/makepkg-cg.conf"
}
