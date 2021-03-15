# Maintainer: Elaina Martineau <elainamartineau@gmail.com>
pkgname=ttf-octicons
pkgver=12.1.0
pkgrel=3
pkgdesc="A scalable set of icons handcrafted with <3 by GitHub"
arch=('any')
license=('MIT')
url="https://octicons.github.com/"
makedepends=('git' 'nodejs' 'npm')
depends=('fontconfig' 'xorg-font-util' 'xorg-mkfontscale')
source=("https://github.com/primer/octicons/archive/v${pkgver}.tar.gz")
sha256sums=('e50e583807ee6cb00c6b44c3158f82afbe143c29625a52c76462a1751fdb7428')
install=$pkgname.install

package() {
  cd "${srcdir}/octicons-${pkgver}"
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
  
  local npmdir=node_modules
  mkdir -p "$npmdir"
  npm install --prefix "$npmdir" fantasticon
  mkdir 'font'
  fantasticon icons -o font -t ttf -n octicons

  install -d $pkgdir/usr/share/fonts/TTF/
  install -m644 font/octicons.ttf $pkgdir/usr/share/fonts/TTF/
}
