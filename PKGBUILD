# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com> 
# Contributor: Your Name <linuxboy@fel.hopto.org>

pkgname=snx
pkgver=800010003
pkgrel=3
pkgdesc="Check Point SSL Network Extender (VPN Client)"
arch=('x86_64')
url="https://supportcenter.checkpoint.com/supportcenter/portal/user/anon/page/default.psml/media-type/html?action=portlets.DCFileAction&eventSubmit_doGetdcdetails=&fileid=22824"
license=('GPL')
depends=('lib32-pam' 'lib32-libstdc++5' 'lib32-libx11')
install=snx.install
source=("snx_install.sh::http://dl3.checkpoint.com/paid/72/72c2c91791690927da0586ec873430cf/snx_install_linux30.sh?HashKey=1586786837_eb5d56de39c1f5db5e0a4e1b2ca059cd&xtn=.sh")
noextract=("snx_install.sh")
md5sums=('72c2c91791690927da0586ec873430cf')

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