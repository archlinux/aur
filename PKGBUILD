# Maintainer: feskyde

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
pkgver=26
pkgrel=1
pkgdesc="CUPS printer driver for Kodak ESP and HERO printers"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/cupsdriverkodak/"
license=('GPL2')
depends=('cups')
#optdepends=('cups-usblp: alternative to cups, required by some users')
source=("http://downloads.sourceforge.net/cupsdriverkodak/$pkgname$pkgver.tar.gz")
md5sums=('6da864afb429910b0b30dfad07686580')

build() {

    # Move into the source directory
    cd "$srcdir/$pkgname$pkgver/"

    # Compile the cups driver
    make clean
    make
}

package() {

    # Move into the source directory
    cd "$srcdir/$pkgname$pkgver/"

    # Install the files
    make DESTDIR="${pkgdir}/" install

}
