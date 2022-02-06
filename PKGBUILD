# Maintainer:XXXXXXXXXXXXXXXXXXXXXXXXXXX
pkgname=pam_nfc-git
pkgver=20150407
pkgrel=2
pkgdesc="nfc for pam, git version"
arch=(i686 x86_64)
license=('GPL')
#url=""
depends=('libnfc')
makedepends=('git')
source=(git+https://github.com/nfc-tools/pam_nfc.git)
#backup=('')
#provides=('')
#conflicts=('')
#replaces=('')
md5sums=('SKIP')

pkgver() {
    # Identify latest version.
    cd "$srcdir/pam_nfc"
    git log -1 --format="%cd" --date=short | sed 's|-||g'
}

build() {
    # Compiling lib_nfc.
    cd $srcdir/pam_nfc
    autoreconf -vis
    LDFLAGS="" CFLAGS="" ./configure                     \
        --prefix=/usr               \
	--sysconfdir=/etc           \
	--with-pam-dir=/usr/lib/security
        make -j1
}

package(){
    # Removing unwanted source dir.
    rm -r $startdir/pam_nfc

    # Moving everything to pkg/.
    cd $srcdir/pam_nfc
    make DESTDIR=$pkgdir install
}
