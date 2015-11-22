# Maintainer: Mathieu OTHACEHE <m.othacehe@gmail.com>

pkgname=sencha-cmd-5
pkgver=5.1.3
pkgrel=61
pkgdesc="Sencha Cmd provides a collection of powerful, time-saving features that work together and in conjunction with the Sencha Ext JS and Sencha Touch frameworks"
url="https://www.sencha.com/products/extjs/cmd-download/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('java-runtime')
provides=('sencha-cmd')
conficts=('sencha-cmd')

source_i686=("https://cdn.sencha.com/cmd/$pkgver.$pkgrel/SenchaCmd-$pkgver.$pkgrel-linux.run.zip")
source_x86_64=("https://cdn.sencha.com/cmd/$pkgver.$pkgrel/SenchaCmd-$pkgver.$pkgrel-linux-x64.run.zip")

md5sums_i686=('b4fed5c99dc8942c9800290a62b55dca')
md5sums_x86_64=('b0f5336cbffb9e5def7fb3ab331b7b2f')

case "$CARCH" in
  i686)   _pkg="SenchaCmd-$pkgver.$pkgrel-linux.run" ;;
  x86_64) _pkg="SenchaCmd-$pkgver.$pkgrel-linux-x64.run" ;;
esac
    
build() {
    chmod +x $_pkg
    ./$_pkg --mode unattended --prefix $srcdir/$pkgname-$pkgver
}

package() {
    install -d "$pkgdir/opt"
    mv "$pkgname-$pkgver" "$pkgdir/opt/$pkgname"

    cd "$pkgdir"
    mkdir -p etc/profile.d
    echo 'export PATH=$PATH:/opt/'$pkgname'/Sencha/Cmd/'$pkgver.$pkgrel > "etc/profile.d/${pkgname}.sh"
    echo 'setenv PATH ${PATH}:/opt/'$pkgname'/Sencha/Cmd/'$pkgver.$pkgrel > "etc/profile.d/${pkgname}.csh"
    chmod 755 "etc/profile.d/${pkgname}".{csh,sh}
}
