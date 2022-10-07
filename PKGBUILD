# Maintainer: Sabu Siyad <hello at ssiyad dot com>
# This PKGBUILD is maintained at https://github.com/ssiyad/pkgbuilds/

pkgname=zsh-plugin-wd
_pkgname=wd
pkgver=0.5.2
pkgrel=1
pkgdesc="Jump to custom directories in zsh"
arch=('x86_64')
url="https://github.com/mfaerevaag/wd"
license=("MIT")
depends=("zsh")
provides=("$pkgname")
conflicts=(
    "${pkgname%-git}"
    "$pkgname"
)
source=(
    "$_pkgname::${url}/archive/refs/tags/v${pkgver}.zip"
)
sha256sums=("52a928c0aede59b7a6cbc6a04ed0b76f1f1ebc174bebd2352ae4d89af01a14f5")

install=$pkgname.install

prepare() {
    mkdir -p $pkgdir/usr/share/$_pkgname $pkgdir/usr/share/man/man1 $pkgdir/usr/share/licenses/$pkgname $pkgdir/usr/share/zsh/site-functions
}

build() {
    cd $srcdir/$_pkgname-$pkgver
    gzip -f wd.1
}

package() {
    cd $srcdir/$_pkgname-$pkgver
    install -Dm755 wd.sh $pkgdir/usr/share/$_pkgname/wd.sh
    install -Dm755 wd.1.gz $pkgdir/usr/share/man/man1/wd.1.gz
    install -Dm755 LICENSE $pkgdir/usr/share/licenses/$pkgname
    install -Dm755 _wd.sh $pkgdir/usr/share/zsh/site-functions/_wd
}
