# Maintainer: Joey Dumont     <joey.dumont@gmail.com>
# Maintainer: Bjorn Neergaard <bjorn@neersighted.com>
# Contributor: Danny Su       <contact@dannysu.com>

pkgname=duplicati-latest
pkgver=2.0.4.9
pkgrel=1
_date=2018-12-22
_branch=canary
pkgdesc='A free backup client that securely stores encrypted, incremental, compressed backups on cloud storage services and remote file servers'
url='http://duplicati.com'
license=('LGPL')
install=duplicati.install
source=(https://github.com/duplicati/duplicati/releases/download/v${pkgver}-${pkgver}_${_branch}_${_date}/duplicati-${pkgver}_${_branch}_${_date}.zip
	duplicati-user.service
	duplicati.service
	duplicati.sysusers
	duplicati-cli)
sha256sums=('bc6bfdef1bf6927eec657cf9310a1354c5b02d1868cdc1709709cf3a6e978faf'
            '2eb973cef79731d407bfbc83f754cef588c62ec83dae2112ac93f9c9f0baa403'
            '499eb63532bcad50b897c0874b723eebc6693816fcb9626532f367b5ff51da70'
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
