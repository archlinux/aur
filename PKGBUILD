# Maintainer: fearlessdots <filipebertelli@tutanota.com>
# Contributor: Buce <dmbuce@gmail.com>
# Contributor: ssc <chasessc@gmail.com>

pkgname=minecraft-region-fixer
pkgver=0.3.5
pkgrel=1
pkgdesc="Tries to fix Minecraft worlds (or region files)."
arch=('i686' 'x86_64')
url="https://github.com/Fenixin/Minecraft-Region-Fixer"
license=('GPL')
depends=('python3')
makedepends=('git')
source=("$pkgname.tar.gz::https://github.com/Fenixin/Minecraft-Region-Fixer/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('2fa7b26f2631c856a138f664aa32b37f8ed39e129d254cb8dc14d64b38bfd18f')

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
