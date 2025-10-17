# Old maintainer: Vyacheslav Konovalov <🦀vk@protonmail.com>
# Maintainer: Yoann Laissus <yoann.laissus@gmail.com>

pkgname=filebeat-bin
pkgver=9.1.5
pkgrel=1
pkgdesc='Filebeat sends log files to Logstash or directly to Elasticsearch'
arch=('i686' 'x86_64')
url='https://www.elastic.co/beats/filebeat'
license=('custom:Elastic')
backup=('etc/filebeat/filebeat.yml')
conflicts=(filebeat)
provides=(filebeat)
optdepends=('elasticsearch: for running standalone installation')
options=('!strip')
source=(
    "https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-$pkgver-amd64.deb"
    'filebeat.service'
    'filebeat.sysusers'
    'filebeat.tmpfiles'
)
sha512sums=(
    '196044c0dd3942ed1af4bbd80d159205b014dd2aacb7269b49bd2fd02aeb489a69d363018289707dd420902da5cb3fbfd437f259aab892e55126c87a52812bf8'
    '0869fdf2a4cd55c8c86bd9f59c722a884fd7e77a4710bf0c24e65f1de7168c05f8ed0a0f887fe28fec711de16ac60df7d1bb46edaa5bba3e71d1083bf049b84f'
    'a8b689a8b741d1ed730056a03d5ea01600fc72caea2fd70d404727e0b79436a6af7185b5e39b9ead860dc4c0f232542b75b5c30647d10f4437a93629ed07649e'
    'c9ee78511993bc1769413c95ff78abf39cace665141c924a950ac14519fe042c877e4ff70d0eb008942b8f08ba04c2cc8aa2caf12b8da282f42a17f3f60f74a5'
)

prepare() {
    tar -xf "${srcdir}/data.tar.gz"
}

package() {
    install -Dm644 "${srcdir}/filebeat.service" "${pkgdir}/usr/lib/systemd/system/filebeat.service"
    install -Dm644 "${srcdir}/filebeat.sysusers" "${pkgdir}/usr/lib/sysusers.d/filebeat.conf"
    install -Dm644 "${srcdir}/filebeat.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/filebeat.conf"
    cp -r etc usr "${pkgdir}/"
    chmod 644 "${pkgdir}/etc/filebeat/filebeat.yml"
}
