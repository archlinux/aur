# Contributor: punkrockguy318 <prg@xannode.com>
# Contributor: Vincent Grande <shoober420@gmail.com>

pkgname=rottexpr-shareware-git
pkgver=v0.01
pkgrel=1
pkgdesc='Source port for the original Rise of the Triad (Shareware Version)'
arch=('i686' 'x86_64')
url="https://github.com/LTCHIPS/rottexpr"
license=('GPL3')
conflicts=("rottexpr-shareware")
provides=("rottexpr-shareware")
depends=('sdl2' 'sdl2_mixer')
makedepends=(git)
source=("git+https://github.com/LTCHIPS/rottexpr"
	"https://archive.org/download/rott_shareware/ROTT.zip")
md5sums=('SKIP'
         '6fe2c27966f47644492d6cbacb2614c6')

pkgver() {
  cd rottexpr/src
  git describe --tags | sed 's/-/+/g'
}

build() {
  cd rottexpr/src
  make SHAREWARE=1
}

package() {
  cd rottexpr/src
  install -Dm755 $srcdir/rottexpr/src/rott "$pkgdir"/usr/bin/rottexpr-shareware
  mkdir -p "$pkgdir"/usr/share/rott-shareware
  install -Dm644 $srcdir/DEMO1_3.DMO "$pkgdir"/usr/share/rott-shareware/
  install -Dm644 $srcdir/DEMO2_3.DMO "$pkgdir"/usr/share/rott-shareware/
  install -Dm644 $srcdir/DEMO3_3.DMO "$pkgdir"/usr/share/rott-shareware/
  install -Dm644 $srcdir/DEMO4_3.DMO "$pkgdir"/usr/share/rott-shareware/
  install -Dm644 $srcdir/REMOTE1.RTS "$pkgdir"/usr/share/rott-shareware/
  install -Dm644 $srcdir/HUNTBGIN.RTC "$pkgdir"/usr/share/rott-shareware/
  install -Dm644 $srcdir/HUNTBGIN.RTL "$pkgdir"/usr/share/rott-shareware/
  install -Dm644 $srcdir/HUNTBGIN.WAD "$pkgdir"/usr/share/rott-shareware/
}
