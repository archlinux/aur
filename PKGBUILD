# Maintainer: Storm Dragon <stormdragon2976@gmail.com>
# Contributor: sekret, mail=$(echo c2VrcmV0QHBvc3Rlby5zZQo= | base64 -d)
_pkgname=soundrts
pkgname=$_pkgname-git
pkgver=1.2.a8.r6.g395d894
pkgrel=1
pkgdesc="A real-time strategy audio game"
arch=('any')
url="https://github.com/soundmud/soundrts"
license=('BSD' 'Unknown')
depends=('python2' 'python2-pygame')
makedepends=('git')
optdepends=('espeak: TTS support'
            'speech-dispatcher: TTS support'
            'python2-speechd: For speech-dispatcher to work with SoundRTS.')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+git://github.com/soundmud/soundrts.git"
        "$_pkgname.desktop"
        "$_pkgname.sh")
md5sums=('SKIP'
         'd06721831d47dd0dc5b1c5d19ba55f59'
         'a2ef4d68f7a926f661c30f487e22e0fa')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

package() {
  cd "$_pkgname"
  install -d "$pkgdir/opt/soundrts"
  cp -a * "$pkgdir/opt/soundrts" # not very nice, this installs a lot of unnecessary files

  install -Dm755 "$srcdir/$_pkgname.sh" "$pkgdir/usr/bin/$_pkgname"

  install -Dm644 "$srcdir/$_pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
}

# vim:set ts=2 sw=2 et:
