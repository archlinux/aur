# Contributor: Vojtech Kral <vojtech_kral^hk>

pkgname=fortune-mod-ku-git
pkgver=r34.e92dc09
pkgrel=1
pkgdesc="Fortune cookies from the AbcLinuxu.cz & KERNEL ULTRAS community"
url="http://fortune.kral.hk/"
arch=('any')
license=('unknown')
depends=('fortune-mod')
optdepends=('kfortune: read cookies from a /dev file')
source=(
  'git+https://bitbucket.org/kralyk/ku-fortune-cookies.git'
  'ku-kfortune.rules')
sha256sums=(
  'SKIP'
  '16c2826f2ef494a256d1582ce0bee80897f61c32b01e46f489c0661c531363e1')

_gitname="ku-fortune-cookies"


pkgver()
{
  cd "${srcdir}/${_gitname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build()
{
  cd "${srcdir}/${_gitname}"
  mv abc-nourl abc
  mv abc-nourl.dat abc.dat
}

package()
{
  cd "${srcdir}/${_gitname}"
  install -d "$pkgdir/usr/share/fortune/"
  install -m 644 abc abc.dat "$pkgdir/usr/share/fortune/"
  cd "$srcdir"
  install -D -m 644 ku-kfortune.rules "$pkgdir/etc/udev/rules.d/10-ku-kfortune.rules"
}
