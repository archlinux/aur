# Maintainer: Attila Greguss <floyd0122[at]gmail[dot]com>
# Co-Maintainer/Author: Justin Timperio <justintimperio[at]gmail[dot]com>
 
pkgname=pacback
pkgver=2.0.3
pkgrel=1
pkgdesc='Advanced Version Control for Arch Linux'
arch=('x86_64')
url='https://github.com/JustinTimperio/pacback'
license=('MIT')
provides=('pacback')
conflicts=('pacback-git')
# avoid overwriting modified config files
install='pacback.install'
backup=('etc/pacback.conf')
depends=('python' 'python-rich' 'python-requests' 'pacman-contrib')
makedepends=('zstd')
optdepends=('pigz: Multithreaded de/compression of custom user files')
source=('https://github.com/JustinTimperio/pacback/releases/download/v2.0.3/pacback-2.0.3-SOURCE.tar.zst')
sha512sums=('bbf0eb2a1f0fc5d75ea18936a1482a3ad720fd2ee80e3188a693aacde785d3ac905da567dc695e93af115de68f1f3be86b454e7ca0e56f7da3aebb40547c3046')
 

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
