# Contributor: Chris Brannon <cmbrannon79@gmail.com>
# Maintainer: aksr <aksr at t-com dot me>
pkgname=nmh
pkgver=1.6
pkgrel=3
epoch=
pkgdesc="Powerful electronic mail handling system, based on a set of command-line utilities."
arch=('i686' 'x86_64')
license=('BSD')
url="http://www.nongnu.org/nmh/"
groups=()
depends=('db' 'openssl' 'libsasl')
makedepends=()
checkdepends=()
provides=('nmh')
optdepends=()
conflicts=('nmh-git')
replaces=()
backup=(etc/nmh/MailAliases
        etc/nmh/components
        etc/nmh/digestcomps
        etc/nmh/distcomps
        etc/nmh/forwcomps
        etc/nmh/mhl.body
        etc/nmh/mhl.digest
        etc/nmh/mhl.format
        etc/nmh/mhl.forward
        etc/nmh/mhl.headers
        etc/nmh/mhl.reply
        etc/nmh/mhn.defaults
        etc/nmh/mts.conf
        etc/nmh/rcvdistcomps
        etc/nmh/rcvdistcomps.outbox
        etc/nmh/replcomps
        etc/nmh/replgroupcomps
        etc/nmh/scan.MMDDYY
        etc/nmh/scan.YYYYMMDD
        etc/nmh/scan.default
        etc/nmh/scan.mailx
        etc/nmh/scan.nomime
        etc/nmh/scan.size
        etc/nmh/scan.time
        etc/nmh/scan.timely
        etc/nmh/scan.unseen)
changelog=
install=
source=("http://download.savannah.nongnu.org/releases/nmh/$pkgname-$pkgver.tar.gz")
noextract=()
options=()
md5sums=('766ff2d37736aef76243df9c6610cb77')
sha1sums=('d424a7520c85abfdbd492f70cdae7fce51a88a7f')
sha256sums=('29338ae2bc8722fe8a5904b7b601a63943b72b07b6fcda53f3a354edb6a64bc3')

build() {
    cd "$srcdir/$pkgname-$pkgver"

    ./configure --prefix=/usr                  \
                --sysconfdir=/etc/$pkgname     \
                --libdir=/usr/lib/$pkgname     \
                --libexecdir=/usr/lib/$pkgname \
                --with-cyrus-sasl              \
                --with-tls
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR="$pkgdir/" install
    mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
    install -m644 COPYRIGHT "$pkgdir/usr/share/licenses/$pkgname/"
}

