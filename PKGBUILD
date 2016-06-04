# Maintainer:	Jesse Jaara	<gmail.com: jesse.jaara>
# Contributor:	p2k		<uni-ulm.de: Patrick.Schneider>

pkgname=trid
pkgver=2.24
pkgrel=1
pkgdesc="An utility designed to identify file types from their binary signatures"
arch=('i686' 'x86_64')
url="http://mark0.net/soft-trid-e.html"
license=('CUSTOM')
depends=('python2')
install=trid.install

source=(trid.sh
        update-trid-defs.sh
        update-trid-defs.service
        update-trid-defs.timer
        triupdate-1.00.zip::http://mark0.net/download/tridupdate.zip)

source_i686=(trid-${pkgver}-i686.zip::http://mark0.net/download/trid_linux.zip)
source_x86_64=(trid-${pkgver}-x86_64.zip::http://mark0.net/download/trid_linux_64.zip)
md5sums=('fe447a9fb6da5591ad72bf17e77084ae'
         '6ef06da62edde6c84c9473f7a62969e6'
         'a78caa24cf0851d17b8d3798f9e776a3'
         '2ea012671b50e0761cbc4bbec820952e'
         'fd7e042a50ee1c93ed3147f5bff6d876')
md5sums_i686=('e250feae78ac8e5a5523d044669bba96')
md5sums_x86_64=('75078cdd077c71b89cc1956525a09649')

package() {
  cd "${srcdir}"

  install -D -m755 trid          "${pkgdir}/usr/bin/trid.bin"
  install -D -m755 trid.sh       "${pkgdir}/usr/bin/trid"
  install -D -m755 tridupdate.py "${pkgdir}/usr/share/trid/tridupdate.py"
  install -D -m644 readme.txt    "${pkgdir}/usr/share/trid/README"
  
  install -d 755  "${pkgdir}/usr/share/licenses/trid"
  ln -s /usr/share/trid/ "${pkgdir}/usr/share/licenses/trid/LICENSE"

  install -D -m755 update-trid-defs.sh      "${pkgdir}/usr/bin/update-trid-defs"
  install -D -m644 update-trid-defs.service "${pkgdir}/usr/lib/systemd/system/update-trid-defs.service"
  install -D -m644 update-trid-defs.timer   "${pkgdir}/usr/lib/systemd/system/update-trid-defs.timer"

  install -d -m755 "${pkgdir}/var/lib/trid"
}

