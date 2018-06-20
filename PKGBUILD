# Contributor: Mihai Militaru <mihai dot militaru at xmpp dot ro>

pkgname=xf86-input-wizardpen
_realname=xorg-input-wizardpen
pkgver=0.8.1
pkgrel=5
pkgdesc="X.Org Wizardpen/Genius tablet driver for Linux"
arch=('i686' 'x86_64')
url="https://launchpad.net/wizardpen"
license=('GPL2')
depends=('glibc')
makedepends=('xorg-server-devel')
conflicts=('wizardpen-driver' 'wizardpen')
replaces=('wizardpen-driver' 'wizardpen')
source=(https://launchpad.net/wizardpen/trunk/0.8/+download/${_realname}-${pkgver}.tar.bz2
        config.patch
        xf86RemoveEnabledDevice.patch)
sha1sums=('82060c678dc241de83b2b7415b6ada619b94db36'
          '86ce045389f477d4bb5b3f89fe7bd26ebe80e6db'
          '9bf16b62bc993294ff2a3818730ab8090a5dbfd2')

build() {
  cd "$srcdir/$_realname-$pkgver"
  patch -Np0 -i "$srcdir"/config.patch
  patch -Np0 -i "$srcdir"/xf86RemoveEnabledDevice.patch
  ./autogen.sh --prefix=/usr --with-xorg-conf-dir=/etc/X11/xorg.conf.d
  make
}

package() {
  cd "$srcdir/$_realname-$pkgver"
  make DESTDIR="${pkgdir}" install
}
