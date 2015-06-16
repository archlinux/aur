# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgname=vdr-epgfixer
pkgver=0.3.1_18_g1ad4aaf
_gitver=1ad4aaffdc820af7e0a0f8c45a4beea4f3f10421
_vdrapi=2.2.0
pkgrel=8
pkgdesc="VDR plugin for doing extra fixing of EPG data"
url="http://projects.vdr-developer.org/projects/plg-epgfixer"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
license=('GPL2')
depends=('gcc-libs' 'pcre' "vdr-api=${_vdrapi}")
makedepends=('git')
_plugname=${pkgname//vdr-/}
source=("git://projects.vdr-developer.org/vdr-plugin-epgfixer.git#commit=$_gitver")
backup=("etc/vdr/conf.avail/50-$_plugname.conf"
        'var/lib/vdr/plugins/epgfixer/blacklist.conf'
        'var/lib/vdr/plugins/epgfixer/charset.conf'
        'var/lib/vdr/plugins/epgfixer/epgclone.conf'
        'var/lib/vdr/plugins/epgfixer/regexp.conf')
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/vdr-plugin-$_plugname"
  git describe --tags | sed 's/-/_/g;s/v//'
}


package() {
  cd "${srcdir}/vdr-plugin-$_plugname"
  make DESTDIR="$pkgdir" install

  mkdir -p "$pkgdir/etc/vdr/conf.avail"
  echo "[$_plugname]" > "$pkgdir/etc/vdr/conf.avail/50-$_plugname.conf"

  chown -R 666:666 "$pkgdir/var/lib/vdr"
}
