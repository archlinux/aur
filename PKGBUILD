# Maintainer: AlphaJack <alphajack at tuta dot io>
# Co-Maintainer: Naxels <naxels at gmail dot com>

# https://wiki.archlinux.org/title/Java_package_guidelines
# https://www.metabase.com/docs/latest/installation-and-operation/running-the-metabase-jar-file
# https://www.metabase.com/docs/latest/installation-and-operation/running-metabase-on-debian

pkgname="metabase"
pkgver=0.57.4
pkgrel=1
pkgdesc="The simplest, fastest way to get business intelligence and analytics to everyone in your company"
arch=("x86_64" "aarch64")
url="https://www.metabase.com/"
license=("AGPL")
depends=("java-runtime-headless")
optdepends=("metabase-driver-clickhouse: connect to clickhouse databases"
            "metabase-driver-csv: connect to csv files"
            "metabase-driver-dremio: connect to dremio databases"
            "metabase-driver-duckdb: connect to duckdb files"
            "metabase-driver-teradata: connect to teradata databases"
           )
source=("metabase-$pkgver.jar::https://downloads.metabase.com/v$pkgver.x/metabase.jar"
        "metabase"
        "metabase.conf"
        "metabase.service"
        "metabase.sysusers"
        "metabase.tmpfiles"
        )
b2sums=('28a52f245e924b74a43bf9196d3de64c1981e14ee1de057646af4eef63f0b6289cadfbf0c24b083012c57a25487f473466ddf15bd01414a4265956b687fb66e7'
        '018307ca071fe70426c22b6bdf5801e74b6498735636ba9b8c97d0d6d3c96380fe56a81f608e564fb359fbfd62f44c8b0dbb7a5d4dceeed09111a8764cc23f5d'
        '7c97fd3a8adbe86d29ca92fed57a99b406f12cd742baf091a686c3dffcb6af837b3944299ca30e96ba041db851effee58df30d9eafef2abc967f4b7eb4c26c12'
        '52e9b37eaf29f24d3f10b29813b7bc36bb984ab55d20422b4d4b0df93ba19b62835081c4f261cf3c78d80baf973d9568fa6b910df17a07caeac098b2efe624fa'
        '4a0e18e9dac9bb3fe2a002e295e65bf5526967bd3c2f525936894ffde416b8b5855d3f9f37355d5c22bb9c25d2171c5f6884e964a6c4dcef9c4f158f84d777ac'
        '14c866a846c80d6f68fbe9c77ac1657bf5385cfc1ba90d43929a24bcdcedb81a2d9c5ecbeec77794d487e85a4c29a2e3dfe111146bb381c88895159c8987b55f')
noextract=("metabase-$pkgver.jar")
options=("!strip")
backup=("etc/metabase.conf")

package(){
 install -d -m 750 "$pkgdir/var/lib/metabase"
 install -D -m 755 "metabase" "$pkgdir/usr/bin/metabase"
 install -D -m 644 "metabase-$pkgver.jar" "$pkgdir/usr/share/java/metabase/metabase.jar"
 install -D -m 640 "metabase.conf" "$pkgdir/etc/metabase.conf"
 install -D -m 644 "metabase.service" "$pkgdir/usr/lib/systemd/system/metabase.service"
 install -D -m 644 "metabase.sysusers" "$pkgdir/usr/lib/sysusers.d/metabase.conf"
 install -D -m 644 "metabase.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/metabase.conf"
}
