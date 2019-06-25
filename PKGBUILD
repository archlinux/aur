# Maintainer: Alexander Görtz <aur@nyloc.de>
# Co-maintainer: Dan Beste <dan.ray.beste@gmail.com>
# Co-maintainer: Julien Nicoulaud <julien dot nicoulaud at gmail dot com>
# Contributor: stef204 <https://aur.archlinux.org/account/stef204>

pkgname='borgmatic'
pkgver=1.3.11
pkgrel=1
pkgdesc='Simple, configuration-driven backup software for servers and workstations'
arch=('any')
url='https://torsion.org/borgmatic/'
license=('GPL3')
depends=('borg' 'python-colorama' 'python-pykwalify' 'python-ruamel-yaml')
makedepends=('python-setuptools')
install="${pkgname}.install"
source=(
  "${pkgname}-${pkgver}.tar.gz::https://projects.torsion.org/witten/borgmatic/archive/${pkgver}.tar.gz"
  "${pkgname}.install"
)
sha256sums=('85c79a08a3dc85431e50d1c2504d50d016fe0d892cd36993703b73def3a9e72f'
            '2862763feea83e3ee0fb65c9f3fec648312486cd8ab48cd7cac70a7bb742b55b')

prepare() {
  cd "${pkgname}"

  sed -i 's|/root/.local/bin|/usr/bin|' "sample/systemd/borgmatic.service"
}

package() {
  cd "${pkgname}"

  python setup.py -q install --root="${pkgdir}" --optimize=1

  install -d "${pkgdir}/usr/lib/systemd/system"
  install -m 644 sample/systemd/* "${pkgdir}/usr/lib/systemd/system/"
}

# vim: ts=2 sw=2 et:
