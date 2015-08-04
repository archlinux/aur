# Maintainer:  Peter Mattern <pmattern at arcor dot de>
# Contributor: libernux <dutchman55 at gmx dot com>
# Contributor: Olaf Leidinger <leidola at newcon dot de>
# Contributor: Hervé Cauwelier <herve at oursours dot net>
# Contributor: Marc Straube <dev at marcstraube dot de>

pkgname=brscan2
pkgver=0.2.5_1
pkgrel=1
pkgdesc="SANE driver from Brother for $pkgname models"
arch=("i686" "x86_64")
url="http://support.brother.com"
license=("custom:Brother" "GPL")
depends=("libusb-compat" "sane")
install=brscan2.install
source_i686=("http://download.brother.com/welcome/dlf006639/$pkgname-${pkgver/_/-}.i386.rpm")
sha256sums_i686=("f9c12f8467288c48cd00b532b2c64f53764a001f4b193f1c5f1ac746a1bd7c9c")
source_x86_64=("http://download.brother.com/welcome/dlf006640/$pkgname-${pkgver/_/-}.x86_64.rpm")
sha256sums_x86_64=("ab02c4e2292e9847a0338a225973735ccaec49c3d443f584004c8f91f5d6a8c9")

prepare() {

  # adjust use of lib64 to habits on Arch Linux x86_64

  if [ "$CARCH" == x86_64 ] ; then

    # path
    mv usr/lib64 usr/lib

    # symbolic links
    cd usr/lib
    ln -sf /usr/lib/libbrcolm2.so.1         libbrcolm2.so
    ln -sf /usr/lib/libbrcolm2.so.1.0.1     libbrcolm2.so.1
    ln -sf /usr/lib/libbrscandec2.so.1      libbrscandec2.so
    ln -sf /usr/lib/libbrscandec2.so.1.0.0  libbrscandec2.so.1
    cd sane
    ln -sf /usr/lib/sane/libsane-brother2.so.1      libsane-brother2.so
    ln -sf /usr/lib/sane/libsane-brother2.so.1.0.7  libsane-brother2.so.1

  fi
}

package() {
    cp -a usr $pkgdir
    install -D -m644 $startdir/brother-eula.txt \
      $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
