# Maintainer: mickael9 <mickael9@gmail.com>
# Contributor: Sebastien Duthil <duthils@free.fr>
# Inspiration for service and config files: https://github.com/Bisa/factorio-init

pkgname=factorio-headless-experimental
pkgver=0.14.4
pkgrel=1
pkgdesc="A 2D game about building and maintaining factories - Server version (experimental branch)"
arch=('x86_64')
url="http://www.factorio.com/"
license=('custom: commercial')
conflicts=('factorio' 'factorio-demo' 'factorio-headless' 'factorio-experimental')
install=factorio-headless.install
options=(!strip)
backup=(etc/conf.d/factorio)
source=(LICENSE
        factorio-headless.service
        factorio-headless.conf
        factorio-headless.sysusers
        factorio_headless_x64_${pkgver}.tar.gz::http://www.factorio.com/get-download/${pkgver}/headless/linux64
)

sha256sums=('67ec2f88afff5d7e0ca5fd3301b5d98655269c161a394368fa0ec49fbc0c0e21'
            '7bd33509e1b1c444b77c17049c2fb01d54873d499ca46490988a4d031fd9ca81'
            'a2d849fcf3a40af934c0d1cd99612bef21269dcb0aa00f58c746405afdccac38'
            '87dae15d1bcfb4683faea9c66498bd916bd27f8aa0dc724c4e21076dcf17da64'
            '0a2ecc12665d80714be95996852f10178101af82230334f2ba0dfe155d6c6837')


# no modifications needed, the executable looks for:
# - data in /usr/share/factorio
# - config in ~/.factorio

package() {
  install -Dm755 "${srcdir}/factorio/bin/x64/factorio" "$pkgdir/usr/bin/factorio"
  install -d "${pkgdir}/usr/share/factorio"
  cp -r "${srcdir}/factorio/data"/* "${pkgdir}/usr/share/factorio"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/factorio-headless/LICENSE"

  install -Dm644 "${srcdir}/factorio-headless.sysusers" "$pkgdir/usr/lib/sysusers.d/factorio.conf"
  install -Dm644 "${srcdir}/factorio-headless.conf" "${pkgdir}/etc/conf.d/factorio"
  install -Dm644 "${srcdir}/factorio-headless.service" "${pkgdir}/usr/lib/systemd/system/factorio.service"
}
