# Maintainer: Attila Greguss <floyd0122[at]gmail[dot]com>
# Co-Maintainer/Author: Justin Timperio <justintimperio[at]gmail[dot]com>
 
pkgname=pacback
pkgver=2.1.0
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
source=('https://github.com/JustinTimperio/pacback/releases/download/v2.1.0/pacback-2.1.0-SOURCE.tar.zst')
sha512sums=('d2c3694144dc278eb10346761a8c757dc0a07481519e7f7388efeff61e5accf4ec4881365def654f5fa83ffeff4b09e3562229914b00187164412be455ed0156')
 

package() {
  cd "${srcdir}"
  install -dm 755 "${pkgdir}"{/usr/{share/{pacback,pacback/paf,licenses/pacback},bin/},/etc}
  install -dm 1777 "${pkgdir}"/tmp
  cp -dr --no-preserve='ownership' core "${pkgdir}"/usr/share/pacback
  cp -dr --no-preserve='ownership' LICENSE "${pkgdir}"/usr/share/licenses/pacback
  cp -dr --no-preserve='ownership' config "${pkgdir}"/etc/pacback.conf
  ln -sf /usr/share/pacback/core/pacback.py "${pkgdir}"/usr/bin/pacback
}
