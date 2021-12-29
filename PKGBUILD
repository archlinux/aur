# Maintainer: Maurizio D'Addona <mauritiusdadd@gmail.com>
# Contributor: Mathieu Pasquet <mathieui@mathieui.net>
# Contributor: Bernhard Walle <bernhard.walle@gmx.de>
# Contributor: Michael Eckert <michael.eckert@linuxmail.org>
# Contributor: Guilherme G. Piccoli <gpiccoli@igalia.com>

pkgname=makedumpfile
pkgver=1.7.0
pkgrel=2
pkgdesc="A tool to generate smaller dumpfiles from kdump memory dumps"
license=('GPL2')
depends=('perl' 'elfutils')
makedepends=('zstd' 'lzo' 'snappy')
optdepends=('zstd: for zstd compression'
            'lzo: for lzo compression'
            'snappy: for snappy compression')
arch=('i686' 'x86_64')
url="https://github.com/makedumpfile/makedumpfile"
source=("https://github.com/makedumpfile/makedumpfile/releases/download/${pkgver}/makedumpfile-${pkgver}.tar.gz")
sha256sums=('8985f8df249087ea68c6051dec6dac3ef0703fe2aa87d0266f3951f93aa8da5e')

build() {
  cd $srcdir/$pkgname-$pkgver
  export CFLAGS="-fcommon"
  make LINKTYPE=dynamic USEZSTD=on USELZO=on USESNAPPY=on
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make install DESTDIR="${pkgdir}"

  mv "${pkgdir}/usr/sbin" "${pkgdir}/usr/bin"
}

