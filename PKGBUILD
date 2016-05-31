# Maintainer: Cedric Meury <cedric@meury.com>
pkgname=uchiwa
pkgver=0.14.5
pkgrel=3
pkgdesc="A simple dashboard for the Sensu monitoring framework, built with Go and AngularJS."
arch=('x86_64' 'i686')
url="https://www.uchiwa.io/"
license=('MIT')
install="${pkgname}.install"
depends=('python2' 'bash')
makedepends=('rpmextract' 'rsync' 'wget')
options=('emptydirs')
source=("http://dl.bintray.com/palourde/uchiwa/uchiwa-${pkgver}-1.${CARCH//i686/i386}.rpm"
        'LICENSE'
        'uchiwa.service')
md5sums=('4e0d5c14c4ace11440755d27b74e941e'
         '598261aece4dcb18f35ce5435b652d8a'
         'a7222f9eac2a36b5e5c27a7377831dc5')

package() {
    rm $srcdir/opt/uchiwa/bin/.keep
    rm $srcdir/opt/uchiwa/src/.keep
    rm $srcdir/etc/sensu/dashboard.d/.keep
    rm $srcdir/etc/default/uchiwa
    rm -rf $srcdir/etc/default
    rm $srcdir/etc/init.d/uchiwa
    rm -rf $srcdir/etc/init.d

    rsync -ruDq $srcdir/* $pkgdir
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -D -m644 ${pkgname}.service "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
}

