pkgname=sql-workbench
pkgver=132
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
sha512sums=('96d625b012aea1350fc95e407a3bea1a09444241b3f478b758e243ea90d20df91dfeae97380964a31d33c2b705fb8f0649b7679e68af8abca956b1ed1f1a76da'
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
