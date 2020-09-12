# Maintainer: Attila Greguss <floyd0122[at]gmail[dot]com>
# Co-Maintainer/Author: Justin Timperio <justintimperio[at]gmail[dot]com>
 
pkgname=pacback
pkgver=2.0.3
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
depends=('python' 'python-rich' 'python-requests' 'pacman-contrib')
makedepends=('zstd')
optdepends=('pigz: Multithreaded de/compression of custom user files')
source=('https://github.com/JustinTimperio/pacback/releases/download/v2.0.3/pacback-2.0.3-SOURCE.tar.zst')
sha512sums=('57dd5591a4ca276e107cd1050b7514e5cfc258fcb3c671f027426660f1f0276e605666779e5fdc7091fc9121f37765d49a3163c47cdd276fd71a2a733a09da78')
 

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
