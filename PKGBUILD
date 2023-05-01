# Maintainer: Fredrick R. Brennan <copypaste@kittens.ph>

pkgname=makepkg-cg
_ghuser=ctrlcctrlv
#pkgver='0.2.0'
pkgver='0.2.0.pre'
pkgrel=1
pkgdesc="A makepkg wrapper using Control Groups via systemd.resource-control"
arch=('any')
url="https://github.com/ctrlcctrlv/makepkg-cg"
license=('Apache')
depends=('systemd' 'bash')
#source=("$pkgname-$pkgver.tar.gz")
source=("https://github.com/$_ghuser/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
#sha256sums=(SKIP)
sha256sums=('b2bc5a4be2be314d932c756a3a116c8a15e8adbe4dbf40ae6d91f2f44b2e37eb')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  #CFLAGS="" make
  
  mkdir -p "${pkgdir}/usr/share/makepkg-cg"
  install -Dm644 "inner.sh" "${pkgdir}/usr/share/makepkg-cg/inner.sh"
  # Install the makepkg-cg script
  install -Dm755 makepkg-cg "${pkgdir}/usr/bin/makepkg-cg"
  install -Dm755 makechrootpkg-cg "${pkgdir}/usr/bin/makechrootpkg-cg"
  install -Dm755 makedockerpkg-cg "${pkgdir}/usr/bin/makedockerpkg-cg"
  
  # Install the eBPF program
  # install -Dm755 makepkg-cg-prio/makepkg-cg-prio.bpf.o "${pkgdir}/usr/share/makepkg-cg/makepkg-cg-prio.bpf.o"

  # Install the makepkg-cg configuration file
  install -Dm644 "doc/makepkg-cg.conf" "${pkgdir}/usr/share/makepkg-cg/makepkg-cg.conf"
}
