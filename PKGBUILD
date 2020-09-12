# Maintainer: Attila Greguss <floyd0122[at]gmail[dot]com>
# Co-Maintainer/Author: Justin Timperio <justintimperio[at]gmail[dot]com>
 
pkgname=pacback
pkgver=2.0.2
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
source=('https://github.com/JustinTimperio/pacback/releases/download/v2.0.2/pacback-2.0.2-SOURCE.tar.zst')
sha512sums=('58374666fefa788fcf98e664b44dbc1c4c634146202acd223442433e7423972a8d3017d79e0e37bdae445b6083a25cb3a9f6572a09a459c4b5eb463ff12d2c11')
 

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
