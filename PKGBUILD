# Maintainer: Étienne Deparis <etienne@depar.is>

pkgname=boston-icon-theme
_upname=Boston
pkgver=2.0
pkgrel=1
pkgdesc="A highly minimalist icon theme, with a sober color palette inspired on basic hues and forms."
arch=('any')
url="https://www.opendesktop.org/p/1012402"
license=('CCPL:by-sa')
_od_id=1652343702
_od_size=281660
_od_project_id=1012402
_od_url=$(curl -s "https://www.opendesktop.org/dl?file_id=${_od_id}&file_type=application/x-xz&file_name=${_upname}.tar.xz&file_size=${_od_size}&has_torrent=0&project_id=${_od_project_id}&link_type=download&is_external=false&external_link=null" -X POST -H 'User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:104.0) Gecko/20100101 Firefox/104.0' -H 'Content-Type: application/x-www-form-urlencoded' -H 'Pragma: no-cache' -H 'Cache-Control: no-cache' --data-raw 'download_source=Continue+Download' | sed -n 's|^ *<a href="\([^"]*\)">Please click here</a>.*$|\1|p')
source=($_od_url)
sha256sums=('e4c491d362eb0306e00a35490b28879d7eb988dd45c98814e374eca0ef326780')
options=(!emptydirs)

package() {
    cd "$srcdir/${_upname}"

    install -d -m755 "$pkgdir/usr/share/licenses/$pkgname"
    install -D -m644 license "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -D -m644 third-party "$pkgdir/usr/share/licenses/$pkgname/third-party"

    install -d -m755 "$pkgdir/usr/share/doc/$pkgname"
    install -D -m644 patrons.md "$pkgdir/usr/share/doc/$pkgname/patrons.md"
    install -D -m644 changelog "$pkgdir/usr/share/doc/$pkgname/CHANGELOG"

    install -d -m755 "$pkgdir/usr/share/icons/$_upname"
    for size in 16 48 128 legacy symbolic; do
        mv $size "$pkgdir/usr/share/icons/${_upname}/$size"
    done
    install -D -m644 index.theme "$pkgdir/usr/share/icons/${_upname}/index.theme"
}
