# Maintainer: Andrew Sun <adsun701 at gmail dot com>
# Contributor: Frederik “Freso” S. Olesen <archlinux@freso.dk>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>

pkgname=gtimelog
pkgver=0.11.3
pkgrel=2
pkgdesc='Small GTK+ app for keeping track of your time'
arch=('any')
url='https://gtimelog.org/'
license=('GPL')
depends=('gtk3' 'hicolor-icon-theme' 'python' 'python-gobject' 'python-setuptools')
makedepends=('python-docutils')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('a5a65b7b929aa3b16ecb4213b56f6573a925613bbce3db1969ca26f31d6b8ab2')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py build

  # Generate man page
  rst2man gtimelog.rst > gtimelog.1
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build

  # Install .desktop file and icon(s)
  install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm644 "src/${pkgname}/${pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/48x48/apps/${pkgname}.png"
  install -Dm644 "src/${pkgname}/${pkgname}-large.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${pkgname}.png"
  # Install man page
  install -Dm644 "gtimelog.1" "${pkgdir}/usr/share/man/man1/${pkgname}.1"
  # Install additional documentation
  install -Dm644 "CHANGES.rst" "${pkgdir}/usr/share/doc/${pkgname}/CHANGES.rst"
  install -Dm644 "CONTRIBUTING.rst" "${pkgdir}/usr/share/doc/${pkgname}/CONTRIBUTING.rst"
  install -Dm644 "CONTRIBUTORS.rst" "${pkgdir}/usr/share/doc/${pkgname}/CONTRIBUTORS.rst"
  install -Dm644 "README.rst" "${pkgdir}/usr/share/doc/${pkgname}/README.rst"
  install -Dm644 "TODO.rst" "${pkgdir}/usr/share/doc/${pkgname}/TODO.rst"
}
