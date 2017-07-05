# Maintainer: Joey Dumont     <joey.dumont@gmail.com>
# Maintainer: Bjorn Neergaard <bjorn@neersighted.com>
# Contributor: Danny Su       <contact@dannysu.com>

pkgname=duplicati-latest
pkgver=2.0.1.72
pkgrel=1
_date=2017-07-05
kgdesc='A free backup client that securely stores encrypted, incremental, compressed backups on cloud storage services and remote file servers'
url='http://duplicati.com'
license=('LGPL')
install='duplicati.install'
source=(https://github.com/duplicati/duplicati/releases/download/v${pkgver}-${pkgver}_canary_${_date}/duplicati-${pkgver}_canary_${_date}.zip
        duplicati.service
	duplicati-user.service)
sha256sums=('e0727939494f55dfa7fb36350c06fd5ba5896affae91716cbf9be33098b3e8e2'
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
