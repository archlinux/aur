# Maintainer: Vasia Novikov <n1dr+cmarchlinux@yaaandex.com> (replace "aaa" with "a")

pkgname=bubblewrap-suid
pkgver=0.3.3
pkgrel=4
pkgdesc='Unprivileged sandboxing tool, SUID version for compatibility with linux-hardened and custom-built kernels'
url='https://github.com/projectatomic/bubblewrap'
arch=(x86_64)
license=('GPL-2.0-or-later')
depends=(glibc libcap)
makedepends=(libxslt docbook-xsl git)
source=("${url}/archive/v${pkgver}.tar.gz")
sha512sums=('b1c38fad90ddaa23a5f2dd49f9ec3f9d9af7426af321ae9f7c43dd64f11a448b3502942a42112a1c6ebf8a4dea2e1196b17c31cca9c2f119dc2e0c1674c345ae')

conflicts=(bubblewrap)
provides=(bubblewrap)

prepare() {
  cd bubblewrap
  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd bubblewrap
  ./configure --prefix=/usr --with-priv-mode=setuid
  make
}

package() {
  cd bubblewrap
  make DESTDIR="$pkgdir" install
}
