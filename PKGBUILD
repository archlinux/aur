# Maintainer: Robert Zhou <meep (dot) aur (at) meepzh (dot) com>
# Contributor: Joakim Hellsen (tlovinator@gmail.com)
# Contributor: Andrew Boktor andrew dot boktor at gmail dot com

pkgname=p4d
_version=2025.2
pkgver=2025.2.2852709
pkgrel=1
pkgdesc="Minimal Perforce Helix Core Server"
arch=('x86_64')
url="https://www.perforce.com"
license=('custom:p4d')
depends=()
backup=('etc/p4d.conf')
install="${pkgname}.install"
source=("http://ftp.perforce.com/perforce/r${pkgver:2:4}/bin.linux26${CARCH}/${pkgname}"{,.asc}
        p4d.service
        p4d.conf
       )
validpgpkeys=('E58131C0AEA7B082C6DC4C937123CB760FF18869')
b2sums=('8f222d00858f83d7f4c9f0f4183e04d26ed8c54d51620d1b52295c0bf5cafe0a4484064a0e158828f1d3b99b44f3f22887cba486fea7119a2d43a2b97f186f69'
        'SKIP'
        'dc0666cc96442b03f403991c20f2307114c750a99de48b116bf25e5c4cf8b89efd7ac693104d45600a453d4940debefe8b958254c8b00c5fc080a2cd2f07cc29'
        '4682a3f35e6053c1ffd53e5e49cd07d8d895db69fe66856d94a91670133070f216d754a70b56aa68e27c43dccff4ebac28ed8aa6cdb66eb3311eb59a89718703')

pkgver() {
  # grab the build version from the asc file itself
  echo "${_version}.$(grep "$_version" "${pkgname}.asc" | awk -F'/' '{print $NF}')"
}

package() {
    install -Dm755 ${pkgname} ${pkgdir}/usr/bin/${pkgname}
    install -Dm644 p4d.service ${pkgdir}/usr/lib/systemd/system/p4d.service
    install -Dm644 p4d.conf ${pkgdir}/etc/p4d.conf
}
