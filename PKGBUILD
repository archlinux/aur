# Maintainer: Robert Zhou <meep (dot) aur (at) meepzh (dot) com>
# Contributor: Joakim Hellsen (tlovinator@gmail.com)
# Contributor: Andrew Boktor andrew dot boktor at gmail dot com

pkgname=p4d
_version=2025.1
pkgver=2025.1.2810567
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
b2sums=('4628ad011257e8906a30334e360e2b95c891ab764d6de90b99e80c08184b3e759bb0b2ae97a2bd7a668933de24b18c87e7d2f00a44918c051554733222c1de34'
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
