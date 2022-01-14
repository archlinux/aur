# Maintainer: Christopher Arndt <chris at chrisarndt.de>

pkgname='ffind'
pkgver=1.3.1
pkgrel=1
pkgdesc="A sane replacement for command line file search"
url="https://github.com/jaimebuelta/ffind"
depends=('python-setuptools')
conflicts=("friendly-find")
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz"
        "${pkgname}-LICENSE.txt::https://raw.githubusercontent.com/jaimebuelta/ffind/v${pkgver}/LICENSE.txt")
sha256sums=('91d5d1e824f0f7621cc30c8d28dba8908457f78837234eb78762155c142f68fe'
            '6b9175754584f5fb0e867391e8992bc46d1181826e0d7511f834872bb2312852')


prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # fix setuptools warning
  sed -i -e 's/description-file/description_file/' setup.cfg
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  python setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build

  # license
  install -Dm644 "${srcdir}"/${pkgname}-LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
  # documentation
  install -Dm644 man_pages/ffind.1 -t "${pkgdir}/usr/share/man/man1"
  install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}
