# Maintainer: Mathieu OTHACEHE <m.othacehe@gmail.com>

pkgname=sencha-cmd-6
pkgver=6.0.2
pkgrel=14
pkgdesc="Sencha Cmd provides a collection of powerful, time-saving features that work together and in conjunction with the Sencha Ext JS and Sencha Touch frameworks"
url="https://www.sencha.com/products/extjs/cmd-download/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('java-runtime')
provides=('sencha-cmd')
conficts=('sencha-cmd')

source_i686=("http://cdn.sencha.com/cmd/$pkgver/no-jre/SenchaCmd-$pkgver-linux-i386.sh.zip")
source_x86_64=("http://cdn.sencha.com/cmd/$pkgver/no-jre/SenchaCmd-$pkgver-linux-amd64.sh.zip")

md5sums_i686=('47a1082e8943ab4927a340d89423f3b9')
md5sums_x86_64=('2a0ee5b57fdfebb8e6eabd79786338ca')

case "$CARCH" in
  i686)   _pkg="SenchaCmd-$pkgver.$pkgrel-linux-i386.sh" ;;
  x86_64) _pkg="SenchaCmd-$pkgver.$pkgrel-linux-amd64.sh" ;;
esac
    
build() {
    ./$_pkg -q -dir $srcdir/$pkgname-$pkgver
}

package() {
    install -d "$pkgdir/opt"
    mv "$pkgname-$pkgver" "$pkgdir/opt/$pkgname"

    cd "$pkgdir"
    mkdir -p etc/profile.d
    echo 'export PATH=$PATH:/opt/'$pkgname > "etc/profile.d/${pkgname}.sh"
    echo 'setenv PATH ${PATH}:/opt/'$pkgname > "etc/profile.d/${pkgname}.csh"
    chmod 755 "etc/profile.d/${pkgname}".{csh,sh}
}
