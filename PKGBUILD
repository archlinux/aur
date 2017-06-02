# Maintainer: erik.dubois@gmail.com
# Credits : Maintainer: Bernhard Landauer <oberon@manjaro.org>
# Credits : Author: Hugo Posnic <huluti@manjaro.org>
# https://github.com/manjaro/manjaro-hello
# Version : 0.4.20.1

pkgname=archlabs-hello-git
pkgver=1.1
pkgrel=1
pkgdesc="A tool providing access to documentation and support for new Archlabs users."
url="https://github.com/ARCHLabs/$pkgname"
arch=('any')
license=('GPL')
depends=('gtk3'  'python-gobject')
source=("git+$url.git")
md5sums=('SKIP')


prepare() {
    mv $pkgname $pkgname-$pkgver
}

package() {
    cd $pkgname-$pkgver
    install -dm755 $pkgdir/usr/share/$pkgname
    cp -r data $pkgdir/usr/share/$pkgname
    cp -r ui $pkgdir/usr/share/$pkgname
    install -dm755 $pkgdir/usr/share/icons/hicolor/64x64/apps/
    cp archlabs.png $pkgdir/usr/share/icons/hicolor/64x64/apps/
    install -Dm644 $pkgname.desktop $pkgdir/etc/skel/.config/autostart/$pkgname.desktop
    install -Dm644 $pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
    install -Dm755 src/archlabs_hello.py $pkgdir/usr/bin/$pkgname
    
    cd po
    for lang in $(ls *.po); do
      lang=${lang::-3}
      install -dm755 $pkgdir/usr/share/locale/${lang//_/-}/LC_MESSAGES
      msgfmt -c -o $pkgdir/usr/share/locale/${lang//_/-}/LC_MESSAGES/$pkgname.mo $lang.po
    done
}
