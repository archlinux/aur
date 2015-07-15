# Maintainer: Vlad M. <vlad@archlinux.net>
# Contributor: Nowaker <spam@nowaker.net>
# Contributor: ahmad200512@yandex.ru

pkgname=teamcity
pkgver=9.1
pkgrel=1
pkgdesc='Continuous integration server from JetBrains'
arch=('any')
url="http://www.jetbrains.com/teamcity/"
license=('custom:JetBrains TeamCity')
depends=('java-runtime-headless')
install="$pkgname.install"
source=("http://download.jetbrains.com/teamcity/TeamCity-${pkgver}.tar.gz"
        'teamcity-agent.service'
        'teamcity-server.service'
        'teamcity.conf')
sha512sums=('026cf23d36effee8d944c410fa29d085dba0f5addd82a009d6b7d755015e6f2fedb2d9abde01952d05160014aa25a984b68ebb895f3a454d44481bcd93eb035f'
            'bf8786f45d9b9101027b6efe2e1732988d032cb1ae1655b2188b61eda70d0df49d48c0de191e2eb00378fd44722a61592fcd26f5426ff150fc72d78b448a3223'
            'db22f7e9a58b57df260343973f9338a5828ed7b4949ba45dd6fa26905b502f4a91766cd685d16c3d41cef51c107ea54ac41dda263729c1ba1aee665295a614e3'
            'b8d7ca447939f4883dc673db8cb94ae5663af3baf7027ca18b151c004e0c2323ed710218eed3e5d1f191ea6412476a9f23d72eff61aae414200253735612b66c')
options=('!strip')
PKGEXT='.pkg.tar'

package() {
  mkdir -p "${pkgdir}/usr/share/licenses"
  mkdir -p "${pkgdir}/var/lib/teamcity"
  mkdir -p "${pkgdir}/opt/${pkgname}"

  install -Dm755 "${srcdir}/teamcity-agent.service" "${pkgdir}/usr/lib/systemd/system/teamcity-agent.service"
  install -Dm755 "${srcdir}/teamcity-server.service" "${pkgdir}/usr/lib/systemd/system/teamcity-server.service"
  install -Dm755 "${srcdir}/teamcity.conf" "${pkgdir}/etc/conf.d/teamcity"
  cp -R "${srcdir}/TeamCity"/* "${pkgdir}/opt/${pkgname}"
  ln -s "/opt/${pkgname}/licenses" "${pkgdir}/usr/share/licenses/teamcity"
}
