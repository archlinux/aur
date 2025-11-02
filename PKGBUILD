# Maintainer: Audiolinux  audiolinux@fastmail.fm

pkgname=roonserver
_pkgname=RoonServer
pkgver=2.56.1582
pkgrel=1
pkgdesc="The music player for music lovers"
arch=('x86_64')
url="https://roonlabs.com/"
license=('custom')
depends=('alsa-lib' 'glibc' 'ffmpeg' 'cifs-utils' 'icu')
source=("https://download.roonlabs.net/builds/RoonServer_linuxx64.tar.bz2"
        'roonserver.service'
        'copyright')
sha256sums=('SKIP'
         '2aaa468c587d2a0f369bf801596e167ebea5340fdf0f7d253992ff45aaef5e42'
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
