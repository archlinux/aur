# Maintainer: Joey Dumont     <joey.dumont@gmail.com>
# Maintainer: Bjorn Neergaard <bjorn@neersighted.com>
# Contributor: Danny Su       <contact@dannysu.com>

pkgname=duplicati-latest
pkgver=2.0.1.68
pkgrel=1
_date=2017-06-28
kgdesc='A free backup client that securely stores encrypted, incremental, compressed backups on cloud storage services and remote file servers'
url='http://duplicati.com'
license=('LGPL')
install='duplicati.install'
source=(https://github.com/duplicati/duplicati/releases/download/v${pkgver}-${pkgver}_canary_${_date}/duplicati-${pkgver}_canary_${_date}.zip
        duplicati.service
	duplicati-user.service)
sha256sums=('f8f1cc67b1125a58f05949968f7165b56d7b6f4fa18ae05f80f834ded5b5e386'
            '3237249cb9de137c3284a5cd92a451f3a49ec2183c6254be4b5ef7969e04e4a1'
            '973bac022f4952ddbd517675cf67f4ca70699b1c343346d42cf868d61f546201')
arch=('i686' 'x86_64')
depends=('gtk-sharp-2' 'mono')

package() {
  # Install the service.
  install -Dm644 duplicati.service  "${pkgdir}/usr/lib/systemd/system/duplicati.service"
  install -Dm644 duplicati-user.service  "${pkgdir}/usr/lib/systemd/user/duplicati.service"
  rm duplicati.service duplicati-user.service

  # Install the program.
  rm *.zip
  mkdir -p "${pkgdir}/opt/duplicati-latest"
  cp -r . "${pkgdir}/opt/duplicati-latest"
}
