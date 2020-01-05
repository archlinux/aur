# Maintainer: Attila Greguss <floyd0122[at]gmail[dot]com>
# Co-Maintainer/Author: Justin Timperio <justintimperio[at]gmail[dot]com>

pkgname=pacback-git
pkgver=r75.564d7b1
pkgrel=1
pkgdesc='Advanced Rollback Version Control for Arch Linux - Alpha'
arch=('any')
url='https://github.com/JustinTimperio/pacback'
license=('MIT')
provides=('pacback')
conflicts=('pacback')
depends=('python-tqdm' 'arch-install-scripts' 'curl')
optdepends=('pigz: Multithreaded de/compression of restore points')

pkgver() {
  cd "${srcdir}/pacback"
  # Get the version number.
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  git clone --recurse-submodules https://github.com/JustinTimperio/pacback.git
}

package() {
  cd "${srcdir}/pacback"
  install -dm 755 "${pkgdir}"/{usr/share/pacback,usr/bin/}
  cp -dr --no-preserve='ownership' core "${pkgdir}"/usr/share/pacback
  ln -sf /usr/share/pacback/core/pacback.py "${pkgdir}"/usr/bin/pacback
}
