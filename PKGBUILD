# Maintainer: Fabio 'Lolix' Loli <lolix@disroot.org> -> https://github.com/FabioLolix
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname=iconoscope
pkgver=0.9.9
pkgrel=1
pkgdesc='Explore the icon database in your system'
arch=(x86_64)
url='https://github.com/santileortiz/Iconoscope'
license=(GPL3)
depends=(gtk3)
makedepends=(python)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('0b210a89dfa900e60b7a3e2acce8362222fb322c376d0b20b2fe81676d0a8830')

prepare() {
  # Add LDFLAGS
  sed -i.bak "s/-lm/& ${LDFLAGS}/" "Iconoscope-${pkgver}/pymk.py"
}

build() {
  cd "Iconoscope-${pkgver}"
  ./pymk.py iconoscope
}

package() {
  cd "Iconoscope-${pkgver}"
  ./pymk.py install --install_completions --destdir "${pkgdir}/usr/"
  ln -s /usr/bin/com.github.santileortiz.iconoscope "$pkgdir/usr/bin/iconoscope"
}
