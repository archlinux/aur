# Maintainer: Sam Simons <contact at sam-simons dot nl>
# (Loosely) based on otf-inter by Ward Segers & otf-eb-garamond by OmeGa
pkgname=ebgaramond-otf
_pkgname=EBGaramond12
pkgver=1.0
pkgrel=1
pkgdesc='EB Garamond (OTF version) by Octavio Pardo & Georg Duffner'
arch=('any')
url='https://github.com/octaviopardo/EBGaramond12'
license=('custom:OFL')
depends=('fontconfig' 'xorg-font-utils')
source=("https://github.com/octaviopardo/$_pkgname/archive/master.zip")
sha256sums=('a08f5d1e0ad1976330e1c5e57faf384a27628323eaacf797644a3c42bcabac73')

package() {
  cd "$_pkgname-master"
  install -Dm644 OFL.txt "$pkgdir/usr/share/licenses/$pkgname/OFL.txt"

  cd "fonts/otf"
  install -d "$pkgdir/usr/share/fonts/$_pkgname-otf"
  install -m644 *.otf "$pkgdir/usr/share/fonts/$_pkgname-otf/"
}

post_install() {
  echo -n "Updating font cache... "
  fc-cache -s
  mkfontscale "/usr/share/fonts/$_pkgname-otf"
  mkfontdir "/usr/share/fonts/$_pkgname-otf"
  echo "done."
}

post_upgrade() {
  post_install $1
}

post_remove() {
  post_install $1
}
