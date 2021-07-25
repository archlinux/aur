# Maintainer: 
# Contributor: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Tom Carrio <tom@carrio.dev>

pkgname=ttf-jetbrains-mono-git
pkgver=2.225.r31.g333ca68
pkgrel=1
pkgdesc="Typeface for developers, by JetBrains"
arch=(any)
url="https://www.jetbrains.com/lp/mono/"
license=(custom:OFL)
provides=(ttf-jetbrains-mono)
conflicts=(ttf-jetbrains-mono)
makedepends=(git)
source=("git+https://github.com/JetBrains/JetBrainsMono.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/JetBrainsMono"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "${srcdir}/JetBrainsMono"

  find fonts/ttf -type f -name "*.ttf" -exec \
    install -Dm644 -t "$pkgdir/usr/share/fonts/TTF" {} \;
  install -Dm644 OFL.txt -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
