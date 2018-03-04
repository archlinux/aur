# Maintainer: Petar Petrov <petar.petrov.georgiev at gmail d0t com>
pkgname=e-additives.cli
pkgver=1.0.0
pkgrel=2
pkgdesc="Brings food additives info to your console."
arch=('any')
url="https://github.com/vexelon-dot-net/e-additives.cli"
license=('MIT')
groups=()
depends=('python' 'python-colorama')
makedepends=()
checkdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
changelog=
install=ead.install
source=(https://github.com/vexelon-dot-net/e-additives.cli/archive/$pkgver.tar.gz 
	https://github.com/vexelon-dot-net/e-additives.cli/releases/download/1.0.0/eadditives.sqlite3.gz)
sha1sums=('d01b32875402384b62669532b32a1e78ae7fca6f'
	'2dfc53e956a35a8c367940379f1e23c352bec7f5')

runname='ead'

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  touch ${runname}
  echo "#!/bin/sh" > ${runname}
  echo export EAD_DB_PATH="/usr/share/$pkgname/eadditives.sqlite3" >> ${runname}
  echo '/usr/bin/ead-cli.py ''"$@"' >> ${runname}
  echo exit 0 >> ${runname}
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  install -Dm755 $runname ${pkgdir}/usr/bin/${runname}
  install -Dm755 ead.py ${pkgdir}/usr/bin/ead-cli.py
  install -Dm644 ../eadditives.sqlite3 ${pkgdir}/usr/share/${pkgname}/eadditives.sqlite3
  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
