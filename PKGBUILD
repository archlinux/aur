# Maintainer:	Jesse Jaara	<gmail.com: jesse.jaara>
# Contributor:	p2k		<uni-ulm.de: Patrick.Schneider>

pkgname=trid
pkgver=2.24
pkgrel=4
pkgdesc="An utility designed to identify file types from their binary signatures"
arch=('x86_64')
url="http://mark0.net/soft-trid-e.html"
license=('CUSTOM')
depends=('python')
install=trid.install

validpgpkeys=('7EFFF01538C2BE8937BDAF52FABE6DB9D3807047')

source=(trid.sh
        update-trid-defs.sh
        update-trid-defs.service
        update-trid-defs.timer
        triupdate-1.10.zip::http://mark0.net/download/tridupdate.zip
        trid-${pkgver}-x86_64.zip::http://mark0.net/download/trid_linux_64.zip
        trid-${pkgver}-x86_64.zip.asc::http://mark0.net/download/trid_linux_64.zip.asc)
b2sums=('acd89bc33a6f00d2709219fa6f67343680384f320860b7e9e3cc0ead6dddf0ebcc953fbf1a8d2e4d4f2a705b3c0cc20a12ec8bfa6dd849f8235b323cd13575f8'
        'db8916665fbaef5e02993ccaa3098f0906ae5e16862b853de84336533cd3431f0a15b7fd1de5ec0d5f8e50f4444946db718a8597e0079e3641a1d3468134bdfb'
        '00787de3be0a3244669485022015bc1376683dceb80d18194aef9be90a8f77ee4faa4c897f1c60ec06b182bb46fd8e7ee1d27ca0f202a619cee01a4f1a1051be'
        'ad09bd81ba2855ee9a729320ebf0a1528124cc998e6af3f9bfff9524a736d05c77808c7b300f53c9632d5d420bbe9c85cb6e0bee1d32c08df1bedd336e4a98a7'
        '41d43bb2587a3d08030d0f4250027d62876338e56c2d4bafd5adeca343ad678feaf844e7a12e8a0409262a849d04d00a1c352359b619ea7621f81bb91c0066f0'
        'c28e12d6b308a243beeb030dbc09582b703332e9d87d9d6f9ee5f1c7da6e5ce7b57867db00fcfeb30c9ebea8379aac83a16b7ad11c3864dec329e1d0251b05d1'
        'SKIP')

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

