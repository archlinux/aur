# Maintainer: Muflone http://www.muflone.com/contacts/english/

pkgname="mumailer"
pkgver=0.5.0
pkgrel=3
pkgdesc="Simple mailer agent and a Python library to easily interact with SMTP"
url="http://www.muflone.com/mumailer"
arch=('any')
license=('GPL-3.0-or-later')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
depends=('python-yaml' 'python')
conflicts=('python-mumailer')
replaces=('python-mumailer')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/muflone/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('2dc71fe86dffefd404a9ec0d1070f63fd601595e4a66eaaf78bc79cf68f53231')

build() {
  cd "${pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${pkgname}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -d "${pkgdir}/usr/share/doc/${pkgname}"
  ln -s "$(python -c 'print(__import__("site").getsitepackages()[0])')/mumailer/samples" "${pkgdir}/usr/share/doc/${pkgname}"
}

