# Maintainer: Jason Stryker <inbox@jasonstryker.com>
# Contributor: feskyde

# CUPS printer drivers for Kodak ESP and HERO series.

# Taken from the README of the SourceForge project page:
# ...patch from awl29 applied and some other mods.
# The problems with AIO 5100 5300 5500 seem to actually have been
# problems with cups caused by errors in the ppd files. Now these 
# errors are fixed, so we expect to no longer have these problems.
# Reports of testing would be helpful.

# Try building and installing the cups-usblp PKGBUILD from
# the AUR if you have problems with CUPS detecting the
# printer via a USB connection.

# There is no included .install file to restart the cups
# service, since doing so may interrupt a print queue. Be
# sure to restart the cups service after installing or
# updating this driver.

# sudo rc.d restart cups
# or
# sudo systemctl restart cups.service

pkgname=c2esp
pkgver=27
pkgrel=1
pkgdesc="CUPS printer driver for Kodak ESP and HERO printers"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/cupsdriverkodak/"
license=('GPL2')
depends=('cups' 'jbigkit')
source=("http://downloads.sourceforge.net/cupsdriverkodak/$pkgname-$pkgver.tar.gz")
sha256sums=('f095f9cbb539cd48b75cec6fe2f844ba0cb8866ce5e4318ad4ca5ba0224396d4')

build() {

    # Move into the source directory
    cd "$srcdir/$pkgname-$pkgver/"

    sed -i '/time functions used for debugging/a #include <stdio.h>' src/c2espcommon.h

    # Compile the cups driver
    ./configure && make clean && make

}

package() {

    # Move into the source directory
    cd "$srcdir/$pkgname-$pkgver/"

    # Install the files
    make DESTDIR="${pkgdir}/" install

}
