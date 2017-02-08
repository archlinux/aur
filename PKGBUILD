# Maintainer: Mathieu OTHACEHE <m.othacehe@gmail.com>

pkgname=sencha-cmd-6
pkgver=6.2.1
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
sha256sums_i686=('386adee4ff3e94e2d5be5fde07f0dc664e226ecbe17cf70efbb475a6cf87ed4e')
sha256sums_x86_64=('6e8a5421ad37f504fe846d0665bc70e27a57f917b7f047e5d208b9a79b27cd30')

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
