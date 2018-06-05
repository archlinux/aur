# Maintainer: Frederik “Freso” S. Olesen <archlinux@freso.dk>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>

pkgname=gtimelog
pkgver=0.11
pkgrel=5
pkgdesc='Small GTK+ app for keeping track of your time'
arch=('any')
url='https://gtimelog.org/'
license=('GPL')
depends=('python' 'python-gobject' 'python-setuptools')
makedepends=('python-docutils')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('ab43075afdd732e35bfc9f39ee425c23efe0f68258f3bc5688791a12028e6fc7')

build() {
  cd "$pkgname-$pkgver"
  python setup.py build

  # Generate man page
  rst2man gtimelog.rst > gtimelog.1
}

package() {
  cd "$pkgname-$pkgver"
  python setup.py install --skip-build --root="$pkgdir" --optimize=1

  # Install .desktop file and icon(s)
  install -Dm0644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm0644 "src/${pkgname}/${pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/48x48/apps/${pkgname}.png"
  install -Dm0644 "src/${pkgname}/${pkgname}-large.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${pkgname}.png"
  # Install man page
  install -Dm0644 "gtimelog.1" "${pkgdir}/usr/share/man/man1/${pkgname}.1"
  # Install additional documentation
  install -Dm0644 "CHANGES.rst" "${pkgdir}/usr/share/doc/${pkgname}/CHANGES.rst"
  install -Dm0644 "CONTRIBUTING.rst" "${pkgdir}/usr/share/doc/${pkgname}/CONTRIBUTING.rst"
  install -Dm0644 "CONTRIBUTORS.rst" "${pkgdir}/usr/share/doc/${pkgname}/CONTRIBUTORS.rst"
  install -Dm0644 "README.rst" "${pkgdir}/usr/share/doc/${pkgname}/README.rst"
  install -Dm0644 "TODO.rst" "${pkgdir}/usr/share/doc/${pkgname}/TODO.rst"
}
