# Maintainer: fearlessdots <filipebertelli@tutanota.com>
# Contributor: Buce <dmbuce@gmail.com>
# Contributor: ssc <chasessc@gmail.com>

pkgname=minecraft-region-fixer
pkgver=0.3.6
pkgrel=1
pkgdesc="Tries to fix Minecraft worlds (or region files)."
arch=('any')
url="https://github.com/Fenixin/Minecraft-Region-Fixer"
license=('GPL')
depends=('python3')
makedepends=('git')
source=("$pkgname.tar.gz::https://github.com/Fenixin/Minecraft-Region-Fixer/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('614c9cf730afc568509a24c4812d22f7a4d08b84f25c8a1aa1b9bf7e7e395a03')

_extractdir="Minecraft-Region-Fixer-${pkgver}"

prepare() {
  cd "${srcdir}/${_extractdir}"  
  sed -i '1 s|python|python3|g' regionfixer.py
  chmod +x regionfixer.py
}

#build() {
#  cd "$srcdir/$pkgname"
#}

package() {
  cd "${srcdir}/${_extractdir}"

  _installdir="usr/lib/python$(python3 --version 2>&1 | grep -o '3\.[0-9]*')/site-packages/${pkgname}"
  mkdir -p "$pkgdir/$_installdir"
  cp -r * "$pkgdir/$_installdir"

  mkdir -p "$pkgdir/usr/bin"
  ln -s "/$_installdir/regionfixer.py" "$pkgdir/usr/bin/regionfixer"
} 

# vim:set ts=2 sw=2 et:
