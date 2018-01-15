# Maintainer:  Lars Hupel      <lars@hupel.info>
# Contributor: Joey Dumont     <joey.dumont@gmail.com>
# Contributor: Bjorn Neergaard <bjorn@neersighted.com>
# Contributor: Danny Su        <contact@dannysu.com>

pkgname=duplicati2-beta
pkgver=2.0.2.1
pkgrel=2
_date=2017-08-01
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
sha256sums=('e37d126296024a5fae48fdc9896c97a334eeeb6b008a970aa0e1632bc13c77b0'
            'ec25b25d0e331ddfb90940555068aa941c3d5dfaf858cffb6c75e810175c9d27'
            '087db7ce97c4180006c2708d49024c0393f48f83ea2ce8b0b6354fffa554ece9'
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
