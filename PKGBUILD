# Maintainer: Pieter Goetschalckx <3.14.e.ter at gmail dot com>
# Contributor: Andru <dr.andru@gmail.com>

pkgname=nautilus-renamer
pkgver=4.0
pkgrel=1
pkgdesc='Rename multiple files easily in Nautilus (Files).'
arch=('any')
url="http://launchpad.net/nautilus-renamer/"
license=('GPL3')
depends=('python' 'nautilus')
install=nautilus-renamer.install
source=(https://launchpad.net/$pkgname/trunk/$pkgver/+download/${pkgname}_${pkgver}.tar.gz
        50_$pkgname.gschema.override)
sha256sums=('f4fc1d46b7cbd71a0acefce893434474f5cd90a6f198cb070ab301e56f55f43d'
            '719f8a7aaa7458368dacbd87894430cd08c23dd0f2c036e251bc0797b0b004fe')

build() {
  cd "${pkgname}_${pkgver}"
  python2 scripts/genmo.py po/ locale/
}

package() {
  install -Dm644 50_$pkgname.gschema.override $pkgdir/usr/share/glib-2.0/schemas/50_$pkgname.gschema.override

  cd "${pkgname}_${pkgver}"

  install -d $pkgdir/usr/share/locale
  cp -r locale/* $pkgdir/usr/share/locale/

  install -Dm0755 nautilus-renamer.py $pkgdir/usr/share/nautilus-renamer/nautilus-renamer
  install -Dm0644 README $pkgdir/usr/share/nautilus-renamer/README
}
