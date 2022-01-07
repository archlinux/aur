# Maintainer: Vlad Glagolev <scm(at)vaygr(dot)net>

pkgname=gtk-led-askpass
pkgver=0.10
pkgrel=1
pkgdesc="GTK+2-based ssh-askpass"
arch=('i686' 'x86_64')
license=('GPL2')
url="https://github.com/vaygr/gtk-led-askpass"
depends=('gtk2')

source=($pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz
        'dialog.patch')
sha256sums=('793bc992f8abf819c3de851eb68d310146788a7c0963814ea045b43a9f11aaa7'
            '85057c09bdc0f0df06f8aa9978070ed901cd673f0dadbda37d4959c7dd08b94a')

build() {
  CFLAGS+=' -Wno-deprecated-declarations'
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -p0 < "${srcdir}"/dialog.patch
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="$pkgdir" PREFIX="/usr" install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
