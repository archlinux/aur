# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
# Contributor: Marco Franceschetti <vonfritz1 at gmail dot com>

pkgname=vdr-loadepg
pkgver=0.2.6
pkgrel=15
_vdrapi=2.4.0
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
pkgdesc="Displays Canal+ group (Mediahighway) and Sky EPG Data"
url="http://lukkinosat.altervista.org/"
license=("GPL2")
depends=('gcc-libs' "vdr-api=${_vdrapi}")
_plugname=${pkgname//vdr-/}
source=("http://lukkinosat.altervista.org/$pkgname-$pkgver.tgz"
        "50-$_plugname.conf")
backup=("var/lib/vdr/plugins/${_plugname}/loadepg.conf"
        "var/lib/vdr/plugins/${_plugname}/loadepg.equiv"
        "var/lib/vdr/plugins/${_plugname}/sky_it.dict"
        "var/lib/vdr/plugins/${_plugname}/sky_it.themes"
        "var/lib/vdr/plugins/${_plugname}/sky_uk.dict"
        "var/lib/vdr/plugins/${_plugname}/sky_uk.themes"
        "etc/vdr/conf.avail/50-$_plugname.conf")
md5sums=('601c345941cd6d181ff6f5546fd02aee'
         '957b12f37a9136153e934c318b2772ab')

build() {
  cd "${srcdir}/${_plugname}-${pkgver}"
  make
}

package() {
  cd "${srcdir}/${_plugname}-${pkgver}"
  make DESTDIR="${pkgdir}" install

  mkdir -p "$pkgdir/var/lib/vdr/plugins/${_plugname}"
  install -Dm644 "${srcdir}/$_plugname-${pkgver}"/conf/* "$pkgdir/var/lib/vdr/plugins/${_plugname}"

  install -Dm644 "$srcdir/50-$_plugname.conf" "$pkgdir/etc/vdr/conf.avail/50-$_plugname.conf"

  chown -R 666:666 "$pkgdir/var/lib/vdr"
}
