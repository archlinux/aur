# Maintainer: Audiolinux  audiolinux@fastmail.fm

pkgname=roonserver
_pkgname=RoonServer
pkgver=1.8.970
pkgrel=1
pkgdesc="The music player for music lovers"
arch=('x86_64')
url="https://roonlabs.com/"
license=('custom')
depends=('alsa-lib' 'glibc' 'ffmpeg' 'cifs-utils' 'icu')
source=("http://download.roonlabs.com/builds/RoonServer_linuxx64.tar.bz2"
        'roonserver.service'
        'copyright')
sha256sums=('SKIP'
         'f5008f332704bd930425d4aa6fbf1dc9b246f52f5125ff8f29b6a9326b474ed9'
         '31b6cac147644ad4d0908906b91e631752111939be88031e03da72182de5be93')
install=${pkgname}.install

pkgver() {
  grep build ${srcdir}/$_pkgname/VERSION | sed -e 's/ (build /./' -e 's/).*//' -e 's/ //g'
}

package() {
   cd "$srcdir"
   mkdir -p ${pkgdir}/opt/
   bsdtar xf RoonServer_linuxx64.tar.bz2 -C "$pkgdir/opt"

  install -Dm644 "roonserver.service"   "$pkgdir/usr/lib/systemd/system/roonserver.service"
  install -Dm644 "copyright"            "$pkgdir/usr/share/licenses/$pkgname/COPYING"

}
