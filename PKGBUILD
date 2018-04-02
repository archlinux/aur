# Maintainer:  Lars Hupel      <lars@hupel.info>
# Contributor: Joey Dumont     <joey.dumont@gmail.com>
# Contributor: Bjorn Neergaard <bjorn@neersighted.com>
# Contributor: Danny Su        <contact@dannysu.com>

pkgname=duplicati2-beta
pkgver=2.0.3.3
pkgrel=1
_date=2018-04-02
_branch=beta
pkgdesc='A free backup client that securely stores encrypted, incremental, compressed backups on cloud storage services and remote file servers'
url='http://duplicati.com'
license=('LGPL')
install=duplicati.install
conflicts=('duplicati-latest')
source=(https://github.com/duplicati/duplicati/releases/download/v${pkgver}-${pkgver}_${_branch}_${_date}/duplicati-${pkgver}_${_branch}_${_date}.zip
	duplicati-user.service
	duplicati.service
	duplicati.sysusers
	duplicati-cli)
sha256sums=('492635c8669e7c1538a35460f2c1f5e2739244c2e8ceff22a3e5f72997d66a7e'
            '0a4f2a0a6ee8f38166e4d4490db867fa60dddb01ed209ff6a4fe4d5ab79ffa94'
            '46acdb205b9ec152b6028b15a0b4754ff34ac835d49ce765b8ef47a038dbb6e6'
            'b9389b399467f3e02aa8e76bb98f6efbca1166fbc4d0bdf939493f8403462959'
            'f6f903ca443935314afeab4cd2e46cf4bef7c5fb1e81c2d95f670f0993774ce5')
arch=('i686' 'x86_64')
depends=('gtk-sharp-2' 'mono')

package() {
  # Install the service.
  install -Dm644 duplicati.service  "${pkgdir}/usr/lib/systemd/system/duplicati.service"
  install -Dm644 duplicati-user.service  "${pkgdir}/usr/lib/systemd/user/duplicati.service"
  install -Dm644 "$srcdir/duplicati.sysusers" "$pkgdir/usr/lib/sysusers.d/duplicati.conf"
  rm duplicati.service duplicati-user.service

  # Install the program.
  rm *.zip
  mkdir -p "${pkgdir}/opt/duplicati-latest"
  cp -r . "${pkgdir}/opt/duplicati-latest"

  mkdir -p "${pkgdir}/usr/bin"
  install -D -m755 duplicati-cli "${pkgdir}/usr/bin"
}
