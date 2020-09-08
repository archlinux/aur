# Maintainer: Attila Greguss <floyd0122[at]gmail[dot]com>
# Co-Maintainer/Author: Justin Timperio <justintimperio[at]gmail[dot]com>
 
pkgname=pacback
pkgver=2.0.0
pkgrel=0
pkgdesc='Advanced Version Control for Arch Linux'
arch=('x86_64')
url='https://github.com/JustinTimperio/pacback'
license=('MIT')
provides=('pacback')
conflicts=('pacback-git')
# avoid overwriting modified config files
install='pacback.install'
backup=('etc/pacback.conf')
depends=('python' 'python-rich' 'python-requests' 'arch-install-scripts')
makedepends=('zstd')
optdepends=('pigz: Multithreaded de/compression of custom user files')
source=('https://github.com/JustinTimperio/pacback/releases/download/v2.0.0/pacback-2.0.0-SOURCE.tar.zst')
sha512sums=('05c726b4970a4bcabd39bc037ab047f8fbb2c7909817c7fe000f42aaf10580d4ca56640f95bc7466268d1a11bcae91fe07972ad4d98b0a1903629fc223e1a997')
 

package() {
  cd "${srcdir}"
  install -dm 755 "${pkgdir}"{/usr/{share/{pacback,pacback/paf,licences/pacback},bin/},/etc}
  install -dm 1777 "${pkgdir}"/tmp
  cp -dr --no-preserve='ownership' core "${pkgdir}"/usr/share/pacback
  cp -dr --no-preserve='ownership' alpha-upgrade.sh "${pkgdir}"/tmp
  cp -dr --no-preserve='ownership' LICENSE "${pkgdir}"/usr/share/licences/pacback
  cp -dr --no-preserve='ownership' config "${pkgdir}"/etc/pacback.conf
  ln -sf /usr/share/pacback/core/pacback.py "${pkgdir}"/usr/bin/pacback
}
