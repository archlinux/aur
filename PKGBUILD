# Maintainer: erik.dubois@gmail.com
# Credits : Maintainer: Bernhard Landauer <oberon@manjaro.org>
# Credits : Author: Hugo Posnic <huluti@manjaro.org>
# https://github.com/manjaro/manjaro-hello
# https://github.com/manjaro/packages-extra/blob/master/manjaro-hello/PKGBUILD
# Version : 0.4.20.1

pkgname=archlabs-hello-git
_pkgname=archlabs-hello
_licensedir="/usr/share/archlabs/licenses/"
pkgver=2.0
pkgrel=2
pkgdesc="A tool providing access to documentation and support for new Archlabs users."
url="https://github.com/ARCHLabs/$pkgname"
arch=('any')
license=('GPL')
depends=('gtk3'  'python-gobject')
source=(${_pkgname}::"git+https://github.com/ARCHLabs/${_pkgname}.git")
md5sums=('SKIP')

package() {
    cd $_pkgname
    install -dm755 $pkgdir/usr/share/$_pkgname
    cp -r data $pkgdir/usr/share/$_pkgname
    cp -r ui $pkgdir/usr/share/$_pkgname
    install -dm755 $pkgdir/usr/share/icons/hicolor/64x64/apps/
    cp archlabs-hello.png $pkgdir/usr/share/icons/hicolor/64x64/apps/
    cp archlabs.png $pkgdir/usr/share/icons/hicolor/64x64/apps/
    install -Dm644 $_pkgname.desktop $pkgdir/etc/skel/.config/autostart/$_pkgname.desktop
    install -Dm644 $_pkgname.desktop $pkgdir/usr/share/applications/$_pkgname.desktop
    install -Dm755 src/archlabs_hello.py $pkgdir/usr/bin/$_pkgname
	mkdir -p "${pkgdir}${_licensedir}${_pkgname}"
	mv "${srcdir}/${_pkgname}/"LICENSE "${pkgdir}${_licensedir}${_pkgname}/LICENSE"
    
    cd po
    for lang in $(ls *.po); do
      lang=${lang::-3}
      install -dm755 $pkgdir/usr/share/locale/${lang//_/-}/LC_MESSAGES
      msgfmt -c -o $pkgdir/usr/share/locale/${lang//_/-}/LC_MESSAGES/$pkgname.mo $lang.po
    done
}
