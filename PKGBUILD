# Maintainer: Ainola
# Contributor: Chris Fordham

pkgname=python-botocore
pkgver=1.1.8
pkgrel=1
pkgdesc="The low-level, core functionality of boto 3."
url="https://github.com/boto/botocore"
arch=('any')
license=('apache')
depends=('python-jmespath=0.7.1'
         'python-dateutil<3.0.0')
makedepends=('python-setuptools')
conflicts=('python-botocore-git python2-botocore-git')
source=("https://github.com/boto/botocore/archive/${pkgver}.tar.gz")
sha256sums=('338fed0119d819a60b2b7cf1a1a38f93603c5f012a2a483b713425816a43a57c')

package() {
  cd "${srcdir}/${pkgname:7}-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1

	install -D -m644 "$srcdir/${pkgname:7}-$pkgver/requirements.txt" "$pkgdir/usr/share/doc/$pkgname/requirements.txt"
	install -D -m644 "$srcdir/${pkgname:7}-$pkgver/README.rst" ${pkgdir}/usr/share/doc/${pkgname}/README.rst
	install -D -m644 requirements.txt ${pkgdir}/usr/share/doc/${pkgname}/requirements.txt

	install -D -m644 LICENSE.txt "$pkgdir/usr/share/licenses/${pkgname:7}/LICENSE"

  # Do not include the tests/ generated from the install
  rm -Rfv "$pkgdir"/usr/lib/python*/site-packages/tests
}

# vim:set ts=2 sw=2 et:
