# Maintainer: Storm Dragon <stormdragon2976@gmail.com>
# Contributer: Michael Taboada <michael@2mb.solutions>
_pkgname=horseshoes
pkgname=horseshoes-git
pkgver=1.0.3
pkgrel=1
pkgdesc="Audio only game of horseshoes."
arch=('any')
url="https://github.com/2mb-solutions/horseshoes"
license=('unlicense')
depends=('speech-dispatcher' 'allegro')
makedepends=('gcc' 'git')
optdepends=('espeak: TTS support'
	'festival: TTS support'
	'flite: TTS support')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname.desktop"
        "$_pkgname.sh")
install="${_pkgname}.install"
md5sums=('7be0952ea7c4286f9f64d39bd98f1497'
         '8f6e9504843af79b9a3761d833c2fdb9')

prepare()
{
  cd "$srcdir"
  git clone --recursive ${url}.git
}

build()
{
  cd "$_pkgname"
git checkout v${pkgver}
  ./comp.sh
}

package()
 {
  cd "$_pkgname"
  install -d "$pkgdir/opt/horseshoes"
install -m755 "horseshoes" "$pkgdir/opt/horseshoes"
cp -a sounds/ "$pkgdir/opt/horseshoes"
  install -Dm755 "${srcdir}/${_pkgname}.sh" "$pkgdir/usr/bin/${_pkgname}"
  install -Dm644 "${srcdir}/${_pkgname}.desktop" "$pkgdir/usr/share/applications/${_pkgname}.desktop"
  }

# vim:set ts=2 sw=2 et:
