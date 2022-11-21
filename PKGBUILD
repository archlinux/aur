# Maintainer: Danny Waser <danny@waser.tech>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Tomislav Ivek <tomislav.ivek@gmail.com>

pkgname=python38-distro
pkgver=1.8.0
pkgrel=1
pkgdesc='Linux OS platform information API'
url='https://github.com/python-distro/distro'
arch=('any')
license=('Apache')
depends=('python' 'python38-setuptools')
makedepends=('python38-sphinx' 'python38-build' 'python38-installer' 'python38-wheel')
checkdepends=('python38-pytest')
options=('!makeflags')
source=(${url}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha512sums=('05e857b85f701a0289343cb1254fd82e2826705ce1859078e23f2f2e97fa7edbffec1dc6b79b0cc5c9800ddd25b970da2d75978b4f65c4113b835c69c4e8141c')
b2sums=('3608ee82db15a5385fc89b74339bc13f516170481e369791f79a0002295adf939126f9b0658a9fad9325e616b86125d48fe9a7e1709f55e7159052e5927239b7')

build() {
  cd distro-${pkgver}
  python3.8 -m build --wheel --no-isolation
}

check() {
  cd distro-${pkgver}
  PYTHONPATH="build/lib" pytest
}

package() {
  cd distro-${pkgver}
  python3.8 -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 README.md CHANGELOG.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}

# vim: ts=2 sw=2 et:
