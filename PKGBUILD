# Maintainer: Volker Schatz <arch@my-name-without-hyphen.com>
pkgname="pinentry-tty"
pkgver=0.9.1
pkgrel=1
pkgdesc="Passphrase entry on the command line for GnuPG and others"
depends=('libcap>=2.16')
provides=('pinentry')
arch=('i686' 'x86_64')
license=('GPL')
url="http://gnupg.org/related_software/pinentry/"
source=("ftp://ftp.gnupg.org/gcrypt/pinentry/pinentry-$pkgver.tar.bz2")
md5sums=('d224d031130aedb44b05164cb04ed88b')

build() {
    cd $srcdir/pinentry-$pkgver 
    ./configure --prefix=/usr \
                --enable-pinentry-tty \
                --disable-pinentry-curses \
                --disable-pinentry-gtk2 \
                --disable-pinentry-qt4 \
                --disable-fallback-curses
    make 
} 

package() {
    cd $srcdir/pinentry-$pkgver 
    make DESTDIR=${pkgdir} install 
    # Remove files conflicting with official pinentry package:
    cd $pkgdir
    rm -f usr/bin/pinentry
    rm -f usr/share/info/pinentry.info
    echo "******************************************************"
    echo "*  Remember to add the line:"
    echo "*  pinentry-program /usr/bin/pinentry-tty"
    echo "*  to your ~/.gnupg/gpg-agent.conf to use this program"
    echo "******************************************************"
}

