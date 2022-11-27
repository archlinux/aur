# Maintainer: Muflone http://www.muflone.com/contacts/english/

_pkgname=mumailer
pkgname=("python-mumailer" "mumailer")
pkgver=0.3.0
pkgrel=1
pkgdesc="Simple mailer agent using SMTP"
url="http://www.muflone.com/mumailer"
arch=('any')
license=('GPL3')
makedepends=('python-setuptools')
depends=('python-yaml')
source=("${_pkgname}-${pkgver}.tar.gz"::"https://github.com/muflone/${_pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('9c13c0ea57db09a499cd11e4208e944df4182fb8e793141c7c63c9d315c4b740')

build() {
  cd "${_pkgname}-${pkgver}"
  python setup.py build
}

package_python-mumailer() {
  cd "${_pkgname}-${pkgver}"
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  for _file in "${pkgdir}/usr/lib/python3.10/site-packages/mumailer/samples"/*.py
  do
    chmod +x "${_file}"
    sed -i '1i#!/usr/bin/python' "${_file}"
  done
  install -d "${pkgdir}/usr/share/doc/${pkgname}"
  ln -s "/usr/lib/python3.10/site-packages/mumailer/samples" "${pkgdir}/usr/share/doc/${pkgname}"
}

package_mumailer() {
  depends=('python-mumailer')

  cd "${_pkgname}-${pkgver}"
  install -d "${pkgdir}/usr/bin"
  ln -s "/usr/lib/python3.10/site-packages/mumailer/samples/profile_smtp.py" "${pkgdir}/usr/bin/${pkgname}"
}

