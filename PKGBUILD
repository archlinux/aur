pkgname=sql-workbench
pkgver=128
pkgrel=1
epoch=
pkgdesc="SQL Workbench/J is a free, DBMS-independent, cross-platform SQL query tool."
arch=('any')
url="https://www.sql-workbench.eu/"
license=('custom')
depends=('java-runtime>=11')
makedepends=(
    'unzip'
)
provides=('SQL-Workbench')
replaces=('sqlworkbench')
source=("https://www.sql-workbench.eu/Workbench-Build${pkgver}.zip"
         'sqlworkbench.desktop')
noextract=("Workbench-Build${pkgver}.zip")
sha512sums=('7ff77201037e2917d94181d3446d8ac6c28b843a2b1751c05a2a876f8df533e3aaf69392768ab4411a32b2d9cbf6e0f49d9c0b888b26d1fd362ceae06a3cdefa'
            '75ae69830b1d8c492c232600b36cda84e13e96cbc235c971af501496dc4874ffd05c28e28d53460d2239517dcbb9b51518a75705a7a0ecf70a89f5beaf8d96da')

build() {
    unzip "Workbench-Build${pkgver}".zip
    rm "Workbench-Build${pkgver}".zip
}

package() {
    cd $srcdir

    # Need to keep manual and history in same dir as jar
    install -m 644 -D -t $pkgdir/opt/SQLWorkbench \
          sqlworkbench.jar \
          log4j-sample.xml
    install -m 755 -D -t $pkgdir/opt/SQLWorkbench \
          sqlworkbench.sh \
          sqlwbconsole.sh
    install -m 644 -D -t $pkgdir/usr/share/sqlworkbench/xslt           xslt/*.*
    install -m 644 -D -t $pkgdir/usr/share/sqlworkbench/manual         manual/*.*
    install -m 644 -D -t $pkgdir/usr/share/sqlworkbench/manual/images  manual/images/*.*
    install -m 644 -D -t $pkgdir/usr/share/pixmaps                     workbench32.png
    install -m 644 -D -t $pkgdir/usr/share/icons/hicolor/32x32/apps    workbench32.png
    install -m 644 -D -t $pkgdir/usr/share/licenses/sqlworkbench       LICENSE
    install -m 644 -D -t $pkgdir/usr/share/applications                sqlworkbench.desktop

    # Create app link in /usr/bin
    install -d $pkgdir/usr/bin
    ln -s /opt/SQLWorkbench/sqlworkbench.sh $pkgdir/usr/bin/sqlworkbench
}
