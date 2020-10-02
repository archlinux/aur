# Maintainer: Carson Rueter <roachh@protonmail.com>

pkgname='denise-bin'
_pkgname='denise'
pkgdesc='Highly accurate C64/Amiga emulator - binary releases'
url='https://sourceforge.net/projects/deniseemu/'
license=('GPL')
pkgver=1.0.8
pkgrel=1
_filename="${_pkgname}_linux_v${pkgver}"
source=("https://sourceforge.net/projects/deniseemu/files/v%20${pkgver}/${_filename}.tar.gz"
        "desktop_patch.patch")
md5sums=('9adddea0fc2952e084eb58317da36b43'
         '6b7f888ac874aa42cb852ab33d651580')
provides=('denise')
conflicts=('denise-bin' 'denise-git')
depends=('sdl2' 'gtk3')
arch=('i686' 'x86_64')

prepare() {
  patch --binary -Np1 -i desktop_patch.patch
}
package() {
  cd "$srcdir/$_filename"
  mkdir -p $pkgdir/usr/bin/
  mkdir -p $pkgdir/usr/share/icons/
  mkdir -p $pkgdir/usr/share/applications/
  mkdir -p $pkgdir/usr/lib/$_pkgname/translation/
  mkdir -p $pkgdir/usr/lib/$_pkgname/data/
  mkdir -p $pkgdir/usr/lib/$_pkgname/fonts/
  mkdir -p $pkgdir/usr/lib/$_pkgname/img/
  mkdir -p $pkgdir/usr/lib/$_pkgname/shader/

  install -Dm755 Denise $pkgdir/usr/bin/$_pkgname
  install -Dm644 $_pkgname.png $pkgdir/usr/share/icons/
  install -Dm644 $_pkgname.desktop $pkgdir/usr/share/applications/
  install -Dm644 translation/* $pkgdir/usr/lib/$_pkgname/translation/
  install -Dm644 data/* $pkgdir/usr/lib/$_pkgname/data/
  install -Dm644 fonts/* $pkgdir/usr/lib/$_pkgname/fonts/
  install -Dm644 img/startscreen.png $pkgdir/usr/lib/$_pkgname/img/
  cp -r shader $pkgdir/usr/lib/$_pkgname/
}

