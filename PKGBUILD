# Contributor: qaz <fkxxyz@163.com>
pkgname=xfce4-mixer
pkgver=4.11.0
pkgrel=2
pkgdesc="A volume control application based on GStreamer"
arch=('i686' 'x86_64' 'mips64el' 'armv6h' 'armv7h' 'arm' 'aarch64')
url="https://git.xfce.org/apps/xfce4-mixer/"
license=('GPL2')
depends=('xfce4-panel' 'alsa-lib>=1.2.1')
makedepends=('xfce4-dev-tools')
source=('git+https://git.xfce.org/apps/xfce4-mixer#commit=ce642ac52e0bed7495261694fd630748bf71157f'
	xfce4-mixer-alsa-git.patch
        no-full-debug-default-for-git.patch)

sha256sums=('SKIP'
            'd044469a259a86e44dfa107f2b8051774848ef43bc72d0d91220dd40641efeb6'
            '85d5226a930aae0fa43e6ab8b8dab4f28f3555f40b05f0f8f315d7d4cd60d408')

prepare() {
 cd "$srcdir/$pkgname"
 patch -Np1 -i "${srcdir}/xfce4-mixer-alsa-git.patch"
 patch -Np1 -i "${srcdir}/no-full-debug-default-for-git.patch"
}

build() {
  cd "$srcdir/$pkgname"
  ./autogen.sh --localstatedir=/var --prefix=/usr --sysconfdir=/etc
  make
}

package ()
{
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir" install
}
