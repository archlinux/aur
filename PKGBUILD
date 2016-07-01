# Maintainer: mickael9 <mickael9@gmail.com>
# Contributor: Sebastien Duthil <duthils@free.fr>
# Inspiration for service and config files: https://github.com/Bisa/factorio-init

pkgname=factorio-headless-experimental
pkgver=0.13.2
pkgrel=2
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
        factorio_headless_x64_${pkgver}.tar.gz::http://www.factorio.com/get-download/${pkgver}/headless/linux64)
sha256sums=('67ec2f88afff5d7e0ca5fd3301b5d98655269c161a394368fa0ec49fbc0c0e21'
            'c4b2b0f7aa32cc2bf1e662a811b73802ea2040ad3a7b9c973d36b6025a245e4e'
            'd0f658296d77052b332a5f5ab940cd77b9d00deebc86eaf669d3ad86c0356aa4'
            '87dae15d1bcfb4683faea9c66498bd916bd27f8aa0dc724c4e21076dcf17da64'
            '6ee4d5363e32dcd8c1496d32080dc35284aca2419e9ea19c2b34a4456cac1240')


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
