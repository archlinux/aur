# Maintainer: Henry-Joseph Audéoud <h.audeoud@gmail.com>
# Contributor: getzze <getzze at gmail dot com>

pkgname=jupyter-nbextension-rise
_name=rise
pkgver=5.7.1
pkgrel=1
pkgdesc="Live Reveal.js Jupyter/IPython Slideshow Extension"
arch=(any)
url="https://github.com/damianavila/RISE"
license=('BSD')
conflicts=('python-rise')
depends=('python' 'jupyter-notebook')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('641db777cb907bf5e6dc053098d7fd213813fa9a946542e52b900eb7095289a6')

package() {
  cd "$srcdir/rise-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1

  install -D -m644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # No need to call `jupyter nbextension install rise`, it is handled in setup.py
  # however, change the path from /usr/etc to /etc
  mv "$pkgdir/"{usr/etc,etc}
}
