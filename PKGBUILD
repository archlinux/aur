# Maintainer: Moritz Bunkus <moritz@bunkus.org>
pkgname='iwatch'
pkgver='0.2.2'
pkgrel='2'
pkgdesc="realtime filesystem monitoring program using inotify"
arch=('any')
license=('GPL')
options=('!emptydirs')
depends=('perl-event' 'perl-linux-inotify2' 'perl-mail-sendmail' 'perl-xml-simpleobject-libxml')
backup=('etc/iwatch/iwatch.xml')
url='http://iwatch.sourceforge.net/'
source=('http://sourceforge.net/projects/iwatch/files/iwatch/0.2.2/iwatch-0.2.2.tgz/download'
        'iwatch.service')
md5sums=('b32155e844b0d58871dc72041160938d'
         '0d18bc48c52b1858e865715582a1f914')
sha512sums=('2aecf2f23e0768076c076cbd58040970d6a7fe05e7030ccae4f856b448be6dee8dfdd4180c0979783d56bb3ccd2edb420e19c65c20ca9222b2a63276b2d79232'
            '88896aef2d9859488cfd1d6b941a702d870346e7f09de7d3bee5e51614f596b125fe7849dc6bffbc1b36067be94ad8d1d530299f3f183ff9ce4a2c9e418a40a3')

build() {
  cd "${srcdir}/iwatch"
  sed -i -e 's:/etc/iwatch.dtd:/etc/iwatch/iwatch.dtd:g' iwatch.xml
}

package() {
  install -Dm644 iwatch.service "${pkgdir}/usr/lib/systemd/system/iwatch.service"
  cd "${srcdir}/iwatch"
  for file in AUTHORS ChangeLog COPYING iwatch.xml.example README ; do
    install -Dm644 "${file}" "${pkgdir}/usr/share/doc/iwatch/${file}"
  done
  install -D iwatch "${pkgdir}/usr/bin/iwatch"
  install -Dm644 iwatch.xml "${pkgdir}/etc/iwatch/iwatch.xml"
  install -Dm644 iwatch.dtd "${pkgdir}/etc/iwatch/iwatch.dtd"
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
