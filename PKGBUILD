# Maintainer: Cleber Matheus <clebermatheus@outlook.com>
pkgname=ttf-octicons
pkgver=19.19.0
pkgrel=1
pkgdesc="A scalable set of icons handcrafted with <3 by GitHub"
arch=('any')
license=('MIT')
url="https://octicons.github.com/"
makedepends=('git' 'npm' 'nodejs>=16.0.0')
depends=('fontconfig' 'xorg-font-util' 'xorg-mkfontscale')
source=("${pkgname}_v${pkgver}.tar.gz::https://github.com/primer/octicons/archive/v${pkgver}.tar.gz")
sha256sums=('105c09edb8d904be9b8d96cce94f08e315f867d2a485d3be6f3337b5f42fc8a4')
install=$pkgname.install

build() {
  cd "${srcdir}"
  npm install --prefix ${srcdir} fantasticon
  mkdir -p 'font'
  npm exec -- fantasticon ${srcdir}/octicons-${pkgver}/icons -o font -t ttf -n octicons
}

package() {
  cd "${srcdir}/octicons-${pkgver}"
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE

  install -d $pkgdir/usr/share/fonts/TTF/
  install -m644 ../font/octicons.ttf $pkgdir/usr/share/fonts/TTF/
}
