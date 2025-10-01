# Maintainer: AlphaJack <alphajack at tuta dot io>

# https://wiki.archlinux.org/title/Java_package_guidelines
# https://www.metabase.com/docs/latest/installation-and-operation/running-the-metabase-jar-file
# https://www.metabase.com/docs/latest/installation-and-operation/running-metabase-on-debian

pkgname="metabase"
pkgver=0.56.8
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
source=("metabase-$pkgver.jar::https://downloads.metabase.com/v$pkgver/metabase.jar"
        "metabase"
        "metabase.conf"
        "metabase.service"
        "metabase.sysusers"
        "metabase.tmpfiles"
        )
b2sums=('9f82e38dbf96329fdaff979980e2a1a6350c88d3e7232fee95cc484501c151e75cd4842cad355e15a4be8915df095ac7b56eeb2644c6810c5df69279a7eff34e'
        'c7e882fab59a0db73dc5a12ade3e5f7d12f695b8e9d2377824fa966e84c624a2e19871678d151ac11027c4910b538249b857ef3d14e3b909065aac8d08b44c92'
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
