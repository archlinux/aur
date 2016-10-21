# Maintainer: Michael Taboada <michael@2mb.solutions>
# Contributer: Storm Dragon <stormdragon2976@gmail.com>
pkgname=horseshoes
pkgver=1.0.4
pkgrel=2
pkgdesc="Audio only game of horseshoes."
arch=('any')
url="https://github.com/2mb-solutions/horseshoes"
license=('MIT')
depends=('speech-dispatcher' 'allegro')
makedepends=('gcc' 'git')
optdepends=('espeak: TTS support'
	'festival: TTS support'
	'flite: TTS support')
source=("$pkgname.desktop"
        "$pkgname.sh")
install="${pkgname}.install"
md5sums=('7be0952ea7c4286f9f64d39bd98f1497'
         '8f6e9504843af79b9a3761d833c2fdb9')

prepare()
{
  cd "$srcdir"
  git clone --recursive ${url}.git
}

build()
{
  cd "$pkgname"
git checkout v${pkgver}
  ./comp.sh
}

package()
 {
  cd "$pkgname"
  install -d "$pkgdir/opt/horseshoes"
install -m755 "horseshoes" "$pkgdir/opt/horseshoes"
cp -a sounds/ "$pkgdir/opt/horseshoes"
  install -Dm755 "${srcdir}/${pkgname}.sh" "$pkgdir/usr/bin/${pkgname}"
  install -Dm644 "${srcdir}/${pkgname}.desktop" "$pkgdir/usr/share/applications/${pkgname}.desktop"
  }

# vim:set ts=2 sw=2 et:
