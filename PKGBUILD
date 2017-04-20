# Maintainer: Yegorius <yegorius@domic.us>

pkgname=teamcity
pkgver=2017.1
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
sha512sums=('a87f9664865322f594a61859b02483d137a0f017a24a8465e6a6b8af5378d106b2af22ef4aa10b5d755e34743aaf4dd8abc2b2c3855bbdf4a1f4240559e4b0e0'
            'bf8786f45d9b9101027b6efe2e1732988d032cb1ae1655b2188b61eda70d0df49d48c0de191e2eb00378fd44722a61592fcd26f5426ff150fc72d78b448a3223'
            '4cf06ff10623ede0e37fd76727845c9574ef52f2309f93bb44604422cbce633b0cfeed783bc1a5840c457cc8f3e602cb10e9b995a30ca94097d51da23534a063'
            'c2997eafd5cefdb68340815d3286418dfb37e9ba9ab1f3147e89c21ebcdb7fdb5392b7a36b592ea1f4ab0f68da4f5bfc38ae25b475ac3ff10794e99049ea558b')
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
