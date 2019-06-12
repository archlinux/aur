# Maintainer: Alexander Görtz <aur@nyloc.de>
# Co-maintainer: Dan Beste <dan.ray.beste@gmail.com>
# Co-maintainer: Julien Nicoulaud <julien dot nicoulaud at gmail dot com>
# Contributor: stef204 <https://aur.archlinux.org/account/stef204>

pkgname='borgmatic'
pkgver=1.3.5
pkgrel=1
pkgdesc='A wrapper script for Borg backup software that creates and prunes backups'
arch=('any')
url='https://torsion.org/borgmatic/'
license=('GPL3')
depends=('borg' 'python-pykwalify' 'python-ruamel-yaml')
makedepends=('python-setuptools')
install="${pkgname}.install"
source=(
  "${pkgname}-${pkgver}.tar.gz::https://projects.torsion.org/witten/borgmatic/archive/${pkgver}.tar.gz"
  "${pkgname}.install"
  "${pkgname}.service.patch"
)
sha256sums=('ba8cd65ab4ff74408183df7369ed9899cefa4fd8b1323e8215584816d28eb267'
            '2862763feea83e3ee0fb65c9f3fec648312486cd8ab48cd7cac70a7bb742b55b'
            '7428b853f3834f96e9994b4cd0589ddaa4ac39e02a8007f39a9321bd96a2c262')

prepare() {
  cd "${pkgname}"

  patch sample/systemd/borgmatic.service < "${srcdir}/borgmatic.service.patch"
}

package() {
  cd "${pkgname}"
  
  python setup.py -q install --root="${pkgdir}" --optimize=1
  
  install -d "${pkgdir}/usr/lib/systemd/system"
  install -m 644 sample/systemd/* "${pkgdir}/usr/lib/systemd/system/"
}

# vim: ts=2 sw=2 et:
