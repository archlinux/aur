# Maintainer: Audiolinux  audiolinux@fastmail.fm

pkgname=roonserver
_pkgname=RoonServer
pkgver=2.0.1311
pkgrel=2
pkgdesc="The music player for music lovers"
arch=('x86_64')
url="https://roonlabs.com/"
license=('custom')
depends=('alsa-lib' 'glibc' 'ffmpeg' 'cifs-utils' 'icu')
source=("http://download.roonlabs.net/builds/RoonServer_linuxx64.tar.bz2"
        'roonserver.service'
        'copyright'
        'sysusers.d'
        'tmpfiles.d')
sha256sums=('SKIP'
         '49c565f79a86c86e242849ab70fbb4d1f88a451984d8df53f179e7bb6e1ac681'
         '23f46810e4cbe329b0fe68cb48e63009f5a2a2c4bedf7b6574c4386247feb45f'
         '7cf041520e73ac4b5d4529658350b5a530415c3fc070080f6ea260871f2af38a'
         'f2f568abf30931649642686bf8d7b66c19731e1121cf542d125475bd93a87dea')
install=${pkgname}.install

pkgver() {
  grep build ${srcdir}/$_pkgname/VERSION | sed -e 's/ (build /./' -e 's/).*//' -e 's/ //g'
}

package() {
cd "$srcdir"
mkdir -p ${pkgdir}/opt/
bsdtar xf RoonServer_linuxx64.tar.bz2 -C "$pkgdir/opt"
install -Dm644 tmpfiles.d             "${pkgdir}"/usr/lib/tmpfiles.d/roon.conf
install -Dm644 sysusers.d             "${pkgdir}"/usr/lib/sysusers.d/roon.conf
install -Dm644 "roonserver.service"   "$pkgdir/usr/lib/systemd/system/roonserver.service"
install -Dm644 "copyright"            "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
