# Maintainer: Cleber Matheus <clebermatheus@outlook.com>
pkgname=ttf-octicons
pkgver=19.22.0
pkgrel=1
pkgdesc="A scalable set of icons handcrafted with <3 by GitHub"
arch=('any')
license=('MIT')
url="https://octicons.github.com/"
makedepends=('git' 'npm' 'nodejs>=16.0.0')
depends=('fontconfig' 'xorg-font-util' 'xorg-mkfontscale')
source=("${pkgname}_v${pkgver}.tar.gz::https://github.com/primer/octicons/archive/v${pkgver}.tar.gz")
sha256sums=('33a3627c4b971a1df1079b80b05f9ba758a19d291b626911526d64e6bc7659ae')
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
