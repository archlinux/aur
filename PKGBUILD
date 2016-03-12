# Maintainer: Sebastien Duthil <duthils@free.fr>

pkgname=factorio-headless
pkgver=0.12.26
pkgrel=2
pkgdesc="A 2D game about building and maintaining factories - Server version"
arch=('x86_64')
url="http://www.factorio.com/"
license=('custom: commercial')
conflicts=('factorio' 'factorio-demo' 'factorio-experimental')
source=(LICENSE
        factorio_headless_x64_${pkgver}.tar.gz::http://www.factorio.com/download-headless/stable)
sha256sums=('67ec2f88afff5d7e0ca5fd3301b5d98655269c161a394368fa0ec49fbc0c0e21'
            'a7891432c675cc9ac3577c627e348d5f0aca9c06478a659a4e703f5813c79dad')

# no modifications needed, the executable looks for:
# - data in /usr/share/factorio
# - config in ~/.factorio

package() {
  cd "$srcdir/factorio"

  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/usr/share/applications"
  install -g games -m 775 -d "${pkgdir}/usr/share/factorio"
  install -d "${pkgdir}/usr/share/licenses/factorio"

  install -m755 "bin/x64/factorio" "$pkgdir/usr/bin/factorio"
  cp -r data/* "$pkgdir/usr/share/factorio"
  install -m644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/factorio/LICENSE"
}
