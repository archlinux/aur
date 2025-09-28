# Maintainer:	Jesse Jaara	<gmail.com: jesse.jaara>
# Contributor:	p2k		<uni-ulm.de: Patrick.Schneider>

pkgname=trid
pkgver=2.41
pkgrel=1
pkgdesc="An utility designed to identify file types from their binary signatures"
arch=('any')
url="http://mark0.net/soft-trid-e.html"
license=('AGPL-3.0-only OR custom:trid-comercial')
depends=('python')
install=trid.install

validpgpkeys=('B98E7F89E0EDCA59116CCDCC8DFA06F20DB12205')

source=(trid.sh
        update-trid-defs.sh
        update-trid-defs.service
        update-trid-defs.timer
        trid-${pkgver}.zip::http://mark0.net/download/trid.zip
        trid-${pkgver}.zip.asc::http://mark0.net/download/trid.zip.asc)
b2sums=('1072675dcf8b5429c7cdc610042b70fa96d91dd6d6ff81f19326419a80df534e7520f077d4d3b0df455a72de7a4c81981f12d33f7bf7f407342052b20dcaa561'
        '80be244b955a1ee7cdb52231512453df2c97449f977fe9b84155463341aaa4416136f29a25e42bbe21916352214cd45b21e0a89980ee2fb488086d3ee3b5a618'
        '00787de3be0a3244669485022015bc1376683dceb80d18194aef9be90a8f77ee4faa4c897f1c60ec06b182bb46fd8e7ee1d27ca0f202a619cee01a4f1a1051be'
        'ad09bd81ba2855ee9a729320ebf0a1528124cc998e6af3f9bfff9524a736d05c77808c7b300f53c9632d5d420bbe9c85cb6e0bee1d32c08df1bedd336e4a98a7'
        '0e3a52dce3a87ea4ae68ba533c78819cc9b5d945576465339447745e88cc03723897bc86ed9d4ca50740084555872b291250d523be6c71b13ab0793e10afe527'
        'SKIP')

package() {
  cd "${srcdir}"

  install -D -m755 trid.sh       "${pkgdir}/usr/bin/trid"
  install -D -m755 trid.py       "${pkgdir}/usr/share/trid/trid.py"
  install -D -m644 readme.txt    "${pkgdir}/usr/share/trid/README"
  
  install -d 755               "${pkgdir}/usr/share/licenses/trid"
  ln -s /usr/share/trid/README "${pkgdir}/usr/share/licenses/trid/trid-comercial"

  install -D -m755 update-trid-defs.sh      "${pkgdir}/usr/bin/update-trid-defs"
  install -D -m644 update-trid-defs.service "${pkgdir}/usr/lib/systemd/system/update-trid-defs.service"
  install -D -m644 update-trid-defs.timer   "${pkgdir}/usr/lib/systemd/system/update-trid-defs.timer"

  install -d -m755 "${pkgdir}/var/lib/trid"
}

