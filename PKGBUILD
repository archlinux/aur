# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com> 
# Contributor: Your Name <linuxboy@fel.hopto.org>

pkgname=snx
pkgver=800010003
pkgrel=2
pkgdesc="Check Point SSL Network Extender (VPN Client)"
arch=('x86_64')
url="https://supportcenter.checkpoint.com/supportcenter/portal/user/anon/page/default.psml/media-type/html?action=portlets.DCFileAction&eventSubmit_doGetdcdetails=&fileid=22824"
license=('GPL')
depends=('lib32-pam' 'lib32-libstdc++5' 'lib32-libx11')
install=snx.install
source=("https://vpnportal.aktifbank.com.tr/SNX/INSTALL/snx_install.sh")
noextract=("snx_install.sh")
md5sums=('f54c1b997d6f358a4cf32c6cc34b1a12')

prepare() {
    mkdir "$pkgname-$pkgver"
    # ARCHIVE_OFFSET FROM snx_install.sh FILE
    ARCHIVE_OFFSET=80
    tail -n +$ARCHIVE_OFFSET snx_install.sh > snx.tar.bz2
    cd "$pkgname-$pkgver"
    tar -xvf ../snx.tar.bz2
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 snx $pkgdir/usr/bin/snx
    install -dm0700 $pkgdir/etc/snx
    install -dm0700 $pkgdir/etc/snx/tmp
}