# Maintainer: Étienne Deparis <etienne@depar.is>

pkgname=boston-icon-theme
pkgver=0.9
pkgrel=1
pkgdesc="A highly minimalist icon theme, with a sober color palette inspired on basic hues and forms."
arch=('any')
url="https://www.opendesktop.org/p/1012402"
license=('CCPL:by-sa')
_od_id=1612976709
_od_data=($(curl -s "$url" | grep -e 'hash =' -e 'timetamp =' | sed "s/.*= '\\(.*\\)';/\\1/"))
_upname=Boston
source=("https://dllb2.pling.com/api/files/download/id/${_od_id}/s/${_od_data[0]}/t/${_od_data[1]}/u//Boston-icons-$pkgver.tar.xz")
sha256sums=('80b7f8e979a045c80276612c765c3aa8535295c1b95dc92953eef271121fecd3')
options=(!emptydirs)

package() {
    cd "$srcdir/${_upname}"

    install -d -m755 $pkgdir/usr/share/licenses/$pkgname
    install -D -m644 license $pkgdir/usr/share/licenses/$pkgname/LICENSE
    install -D -m644 third-party $pkgdir/usr/share/licenses/$pkgname/third-party

    install -d -m755 $pkgdir/usr/share/doc/$pkgname
    install -D -m644 patrons.md $pkgdir/usr/share/doc/$pkgname/patrons.md
    install -D -m644 changelog $pkgdir/usr/share/doc/$pkgname/CHANGELOG

    install -d -m755 $pkgdir/usr/share/icons/$_upname
    for size in 16 48 128 legacy symbolic; do
        mv $size "$pkgdir/usr/share/icons/${_upname}/$size"
    done
    install -D -m644 index.theme "$pkgdir/usr/share/icons/${_upname}/index.theme"
}
