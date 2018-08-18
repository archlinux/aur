# Contributor: Chris Brannon <cmbrannon79@gmail.com>
# Maintainer: aksr <aksr at t-com dot me>
pkgname=nmh
pkgver=1.7.1
pkgrel=1
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
md5sums=('0f2e117eb3acbe949af43b5048de28c5')
sha1sums=('441b56502827eb8296745520a243c7d46153ad94')
sha256sums=('f1fb94bbf7d95fcd43277c7cfda55633a047187f57afc6c1bb9321852bd07c11')

build() {
    cd "$srcdir/$pkgname-$pkgver"

    ./configure --prefix=/usr         \
                --sysconfdir=/etc     \
                --libdir=/usr/lib     \
                --libexecdir=/usr/lib \
                --with-cyrus-sasl     \
                --with-tls
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR="$pkgdir/" install
    mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
    install -m644 COPYRIGHT "$pkgdir/usr/share/licenses/$pkgname/"
}

