# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgname=vdr-femon
pkgver=2.2.1
_vdrapi=2.2.0
pkgrel=2
pkgdesc="DVB Frontend Status Monitor plugin"
url="http://www.saunalahti.fi/rahrenbe/vdr/femon/"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL2')
depends=('gcc-libs' "vdr-api=${_vdrapi}")
_plugname=${pkgname//vdr-/}
source=("http://www.saunalahti.fi/~rahrenbe/vdr/femon/files/$pkgname-$pkgver.tgz"
        'vdr-2.3.2-femon-2.2.1.diff')
backup=("etc/vdr/conf.avail/50-$_plugname.conf")
md5sums=('9a9d2a553dc72b96a6c8a810ba3c7456'
         'c6f2c2ed0f5af5e792ebeda680db5cff')

prepare() {
  cd "${srcdir}/${_plugname}-${pkgver}"
  if [ `vercmp $_vdrapi 2.3.0` -eq 1 ]; then
    patch -p1 -i "$srcdir/vdr-2.3.2-femon-2.2.1.diff"
  fi
}

build() {
  cd "${srcdir}/${_plugname}-${pkgver}"
  make GITTAG=''
}


package() {
  cd "${srcdir}/${_plugname}-${pkgver}"
  make DESTDIR="$pkgdir" install

  mkdir -p "$pkgdir/etc/vdr/conf.avail"
  echo "[$_plugname]" > "$pkgdir/etc/vdr/conf.avail/50-$_plugname.conf"
}
