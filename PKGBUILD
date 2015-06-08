# Maintainer: Vianney le Clément <vleclement AT gmail · com>
pkgname=avadon-hb
_pkgname=avadon
pkgver=1331768904
pkgrel=1
pkgdesc="Avadon: The Black Fortress (Humble Bundle copy required)"
arch=('i686' 'x86_64')
url="http://www.spidweb.com/avadon/"
license=('custom:commercial')
groups=('humblebundleandroid2')
depends=('sdl' 'openal')
makedepends=('unzip')
options=(!strip)
source=("$_pkgname-linux-$pkgver-bin"::"file://$_pkgname-linux-$pkgver-bin"
        $_pkgname.desktop)
md5sums=('dba7e32cdd8b70f26c4b51f63f858302'
         '917689e613917d3e99d93729fab0b7ad')
sha1sums=('c12d6967c7fbc355cc6499c86df86355ea5eec0b'
          '9154a1f90784a9b45e766206fd45b889aca93982')
#PKGEXT='.pkg.tar'

build() {
  cd "$srcdir"
  # unzip will issue a warning about extra bytes at beginning of file, ignore it
  unzip $_pkgname-linux-$pkgver-bin || true
}

package() {
  cd "$srcdir"

  install -d "$pkgdir/opt"
  cp -r "data" "$pkgdir/opt/$_pkgname"

  install -d "$pkgdir/usr/bin"
  ln -s /opt/avadon/Avadon "$pkgdir/usr/bin/avadon"

  install -Dm644 "$_pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
}

# vim:set ts=2 sw=2 et:
