_pkgbase=etlegacy
pkgname=etlegacy32-bin
pkgdesc="Wolfenstein: Enemy Territory 2.60b compatible client/server (etlegacy engine, 32 bit)"
pkgver=2.76
pkgrel=1
arch=('i686' 'x86_64')
url="http://www.etlegacy.com/"
provides=('etlegacy')
conflicts=('etlegacy')
backup=('usr/lib/etlegacy/etmain/etl_server.cfg'
        'usr/lib/etlegacy/etmain/legacy.cfg'
        'usr/lib/etlegacy/etmain/campaigncycle.cfg'
        'usr/lib/etlegacy/etmain/lmscycle.cfg'
        'usr/lib/etlegacy/etmain/mapvotecycle.cfg'
        'usr/lib/etlegacy/etmain/objectivecycle.cfg')
install=etlegacy.install
depends=("enemy-territory-data")
license=('GPL3')
source=(
    "etl_start.sh"
    "etlded_start.sh"
    "https://www.etlegacy.com/download/file/122"
    "https://github.com/etlegacy/etlegacy/archive/v$pkgver.tar.gz")
sha256sums=(
    'f7133c4255ab94e56a2fc928cd0e31a6a0ce082c600bd2c4b9282dd82ed1cfd3'
    'd53ac64be3c068c606ea51fe41ebcc8464b4e8a975c0353a31e03d2646dea168'
    '94e4847dc4f665c686401a7f33510f70c4431ff7803746865106b55ff357fd24'
    '8bb8e9785e3be983a331c39298c1451cf805299560c769d59b9f04ae51912ee1'
)

package() {
    cd "$_pkgbase-v$pkgver-i386"
    install -dm 755 "${pkgdir}"/usr/{bin,lib/${_pkgbase}/,share/{applications,icons,licenses/${_pkgbase},/doc/${_pkgbase}}}
    cp -dr --no-preserve='ownership' ./ "${pkgdir}"/usr/lib/${_pkgbase}/
    # assets
    ln -s /usr/share/enemy-territory/etmain/{pak0,pak1,pak2}.pk3 $pkgdir/usr/lib/$_pkgbase/etmain/
    install -Dm 755 "${srcdir}"/etl_start.sh "${pkgdir}"/usr/bin/etl
    install -Dm 755 "${srcdir}"/etlded_start.sh "${pkgdir}"/usr/bin/etlded

    # application entry
    cp -dr --no-preserve='ownership' "${srcdir}"/"$_pkgbase-$pkgver"/misc/etl.ico "${pkgdir}"/usr/share/icons/
    cp -dr --no-preserve='ownership' "${srcdir}"/"$_pkgbase-$pkgver"/misc/etlegacy.desktop "${pkgdir}"/usr/share/applications/

    # doc
    mkdir -p $pkgdir/usr/share/doc/$_pkgbase
    mv $pkgdir/usr/lib/$_pkgbase/INSTALL.txt $pkgdir/usr/share/doc/$_pkgbase/

    # license
    mkdir -p $pkgdir/usr/share/licenses/$_pkgbase
    mv $pkgdir/usr/lib/$_pkgbase/COPYING.txt $pkgdir/usr/share/licenses/$_pkgbase/
}
