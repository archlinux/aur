# Maintainer: AlphaJack <alphajack at tuta dot io>

# https://wiki.archlinux.org/title/Java_package_guidelines
# https://www.metabase.com/docs/latest/installation-and-operation/running-the-metabase-jar-file
# https://www.metabase.com/docs/latest/installation-and-operation/running-metabase-on-debian

pkgname="metabase"
pkgver=0.46.6
pkgrel=4
pkgdesc="The simplest, fastest way to get business intelligence and analytics to everyone in your company"
arch=("x86_64" "aarch64")
url="https://www.metabase.com/"
license=("AGPL")
depends=("jre-openjdk-headless")
optdepends=("metabase-driver-clickhouse: connect to clickhouse databases"
            "metabase-driver-csv: connect to csv files"
            "metabase-driver-dremio: connect to dremio databases"
            "metabase-driver-duckdb: connect to duckdb files"
            "metabase-driver-teradata: connect to teradata databases"
           )
source=("https://downloads.metabase.com/v$pkgver/metabase.jar"
        "metabase"
        "metabase.conf"
        "metabase.service"
        "metabase.sysusers"
        "metabase.tmpfiles"
        )
sha256sums=('8511069190e54d08cdd35dbf89333c2031eb5bbdb637ee20546b6c547e91e64a'
            'f26e51e69a188c7eea8dc65f192d326d1ae7009032cd521c798a862d7fbc5365'
            '0135dce8719bf676eb44139776124f1cc8f4ecb53d973e2d78982ab210ce1868'
            '706ec71333804e97429f91c19ff72004a050a24307560b8a2fc4e6db7915964d'
            'c670b2c4c4663590ab2ced38b19b196f1b31ab1c6339ef7caa9225e94db82c92'
            '71478a76412929d5d35ce8aafb85a27a3c73b10a37235ed2ad890c47cb31812b')
noextract=("metabase.jar")
options=("!strip")
backup=("etc/metabase.conf")

package(){
 install -d -m 750 "$pkgdir/var/lib/metabase"
 install -D -m 755 "metabase" "$pkgdir/usr/bin/metabase"
 install -D -m 644 "metabase.jar" "$pkgdir/usr/share/java/metabase/metabase.jar"
 install -D -m 640 "metabase.conf" "$pkgdir/etc/metabase.conf"
 install -D -m 644 "metabase.service" "$pkgdir/usr/lib/systemd/system/metabase.service"
 install -D -m 644 "metabase.sysusers" "$pkgdir/usr/lib/sysusers.d/metabase.conf"
 install -D -m 644 "metabase.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/metabase.conf"
}
