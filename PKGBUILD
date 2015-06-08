# Maintainer: Techlive Zheng <techlivezheng at gmail dot com>
# Contributor: Ivan Morales  <imorales at sismanet dot com>

pkgname=xmail
pkgver=1.27
pkgrel=1
pkgdesc="An java based SMTP/POP3 server"
arch=('i686' 'x86_64')
url="http://www.xmailserver.org/"
license=('GPL')
depends=('openssl')
confilicts=('postfix')
changelog=Changelog
source=(http://www.xmailserver.org/$pkgname-$pkgver.tar.gz xmail xmail.sh xmail.conf)

build() {
    cd $srcdir/$pkgname-$pkgver

    make -f Makefile.lnx || return 1
}

package() {
    cd $srcdir/$pkgname-$pkgver
    
    install -D -m 755 $srcdir/xmail       $pkgdir/etc/rc.d/xmail
    install -D -m 755 $srcdir/xmail.sh    $pkgdir/etc/profile.d/xmail.sh
    install -D -m 755 $srcdir/xmail.conf  $pkgdir/etc/conf.d/xmail.conf

    install -D -m 755 bin/XMail           $pkgdir/usr/sbin/XMail
    install -D -m 755 bin/XMCrypt         $pkgdir/usr/sbin/XMCrypt
    install -D -m 755 bin/MkUsers         $pkgdir/usr/sbin/MkUsers
    install -D -m 755 bin/CtrlClnt        $pkgdir/usr/sbin/CtrlClnt
#   install -D -m 755 bin/MkMachDep       $pkgdir/usr/sbin/MkMachDep
    
    install -D -m 4755 bin/sendmail       $pkgdir/usr/sbin/sendmail

    install -D -m 644 docs/Readme.txt     $pkgdir/usr/share/doc/xmail/Readme.txt
    install -D -m 644 docs/Readme.html    $pkgdir/usr/share/doc/xmail/Readme.html
    install -D -m 644 docs/ChangeLog.txt  $pkgdir/usr/share/doc/xmail/ChangeLog.txt
    install -D -m 644 docs/ChangeLog.html $pkgdir/usr/share/doc/xmail/ChangeLog.html

    cd MailRoot

    find . -type d -exec install -d {,${pkgdir}/opt/xmail/}{} \; || return 1
    find . -type f -exec install -D -m 644 {,${pkgdir}/opt/xmail/}{} \; || return 1

    rmdir ${pkgdir}/opt/xmail/bin
}

md5sums=('73c9d95012709d7b11511dfb6dd6ab3d'
         'e4c301f8674881cd2e00d0dfe5aacd1f'
         '1a668de800a761bb5feda3e247a140d9'
         '94818a1c5850695af8cb7288e13532d9')
