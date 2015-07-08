# Maintainer: Nowaker <spam@nowaker.net>
# Contributor: ahmad200512@yandex.ru

pkgname='teamcity'
pkgver='8.1.3'
pkgrel='1'
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
sha512sums=('2ae69d942bf29f0b03d33766a2ad7bb7eb614641148ba42540e3eab45e5906291e91fec8fba6641276881c4d859ab917530340b790323cf800bc31e7724dd5c1'
            'bf8786f45d9b9101027b6efe2e1732988d032cb1ae1655b2188b61eda70d0df49d48c0de191e2eb00378fd44722a61592fcd26f5426ff150fc72d78b448a3223'
            'db22f7e9a58b57df260343973f9338a5828ed7b4949ba45dd6fa26905b502f4a91766cd685d16c3d41cef51c107ea54ac41dda263729c1ba1aee665295a614e3'
            'f6a1fb4c66f2303fca3fbba511f8a34eb9489fa0e76997e73753dd25d31dae3f8188bff1ff03782b1333b4704090cb10d86d81260677701dc5d8cc48ffa463e4')
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
