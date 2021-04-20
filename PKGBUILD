# Maintainer: Audiolinux  audiolinux@fastmail.fm

pkgname=roonbridge
_pkgname=RoonBridge
pkgver=1.7.571
pkgrel=1
_pkgrel_x86_64=1
_pkgrel_armv7h=1
_pkgrel_aarch64=1
pkgdesc="The music player for music lovers"
arch=('x86_64' 'armv7h' 'aarch64')
url="https://roonlabs.com/"
license=('custom')
depends=('alsa-lib' 'glibc' 'ffmpeg' 'cifs-utils')
source=('roonbridge.service'
        'sysusers.d'
        'tmpfiles.d'
        'copyright')
source_x86_64=("http://download.roonlabs.com/builds/RoonBridge_linuxx64.tar.bz2")
source_armv7h=("http://download.roonlabs.com/builds/RoonBridge_linuxarmv7hf.tar.bz2")
source_aarch64=("http://download.roonlabs.com/builds/RoonBridge_linuxarmv8.tar.bz2")
sha256sums=('141a57f660165f5b04614c643392e941825192bf3f4243aa2ecd75ed099462eb'
            '7cf041520e73ac4b5d4529658350b5a530415c3fc070080f6ea260871f2af38a'
            'f2f568abf30931649642686bf8d7b66c19731e1121cf542d125475bd93a87dea'
            '31b6cac147644ad4d0908906b91e631752111939be88031e03da72182de5be93')
sha256sums_x86_64=('SKIP')
sha256sums_armv7h=('SKIP')
sha256sums_aarch64=('SKIP')
install=${pkgname}.install

pkgver() {
  grep build ${srcdir}/$_pkgname/VERSION | sed -e 's/ (build /./' -e 's/).*//' -e 's/ //g'
}

package() {
   cd "$srcdir"
   mkdir -p ${pkgdir}/opt/
   bsdtar xf RoonBridge_*.tar.bz2 -C "$pkgdir/opt"
   chown -R root:root "$pkgdir/opt/RoonBridge"

  install -Dm644 tmpfiles.d             "${pkgdir}"/usr/lib/tmpfiles.d/roonbridge.conf
  install -Dm644 sysusers.d             "${pkgdir}"/usr/lib/sysusers.d/roonbridge.conf
  install -Dm644 "roonbridge.service"  "$pkgdir/usr/lib/systemd/system/roonbridge.service"
  install -Dm644 "copyright"           "$pkgdir/usr/share/licenses/$pkgname/COPYING"

}
