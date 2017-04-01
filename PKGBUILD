# Maintainer: Mathieu OTHACEHE <m.othacehe@gmail.com>

pkgname=sencha-cmd-6
pkgver=6.2.2
pkgrel=1
pkgdesc="Sencha Cmd provides a collection of powerful, time-saving features that work together and in conjunction with the Sencha Ext JS and Sencha Touch frameworks"
url="https://www.sencha.com/products/extjs/cmd-download/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('java-runtime' 'ttf-dejavu')
provides=('sencha-cmd')
conflicts=('sencha-cmd' 'sencha-cmd-5')
source_i686=("http://cdn.sencha.com/cmd/$pkgver/no-jre/SenchaCmd-$pkgver-linux-i386.sh.zip")
source_x86_64=("http://cdn.sencha.com/cmd/$pkgver/no-jre/SenchaCmd-$pkgver-linux-amd64.sh.zip")
sha512sums_i686=('cfe3e22929103e9d6e6fccd1bc3a176f5b55a2ebfd3b2f35da24daefc0c71aa79f4bd017906f84f827a15c941fff9704d8acf60f7756a795b3726bffbf686ad3')
sha512sums_x86_64=('ea567038bb8d4a576f12bce9afb2b9192a531709a9c949f2705acad2924d348e4cff9c787608ab46af8ebbee0a308c27c2b360701cbaf37b3b34174351021867')

build() {
    find "$srcdir" -name "*.sh" -exec {} -q -dir "$srcdir/$pkgname-$pkgver" \;
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
