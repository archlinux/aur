pkgname=denonavr-cli
pkgver=3
pkgrel=1
pkgdesc="Minimal CLI for Denon (and Marantz) AVRs, using the Python denonavr library."
arch=(any)
url="https://github.com/projg2/denonavr-cli"
license=('MIT')
depends=('python-denonavr>=1.0.0')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel' 'python-flit-core')
source=("https://github.com/projg2/denonavr-cli/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('8d6e64b620cdd7cd4a6c1f4158d68ad9ea00c7e6b98453c258a609e3c39dc397')
sha512sums=('f2bdf442fd3bec788d9ac684d93314da6c7750d946fc563ceb71a52ef1663e1fe06c62653d4e5ff69625749f1eefacc41c92ebcfdf0f6ff7fdf7c7b703d7408d')
b2sums=('4084cbc87363858cb0132847b88c486795332ae28d1c24efb46c22a8985711aa18dfe6b2634f6457ea3108789bb4812ffba17a50edb429fb64a29ca90bbeedaa')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  python -m build --wheel --no-isolation
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -v -m755 -d "${pkgdir}/usr/share/licenses/denonavr-cli"
  install -v -m644 ./LICENSE "${pkgdir}/usr/share/licenses/denonavr-cli/"
}
