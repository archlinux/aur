# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

_pkgname=qtoml
pkgname="python-${_pkgname}"
pkgver=0.3.0
pkgrel=2
pkgdesc="New TOML encoder/decoder"
arch=('any')
url="https://pypi.org/project/${_pkgname}"
license=('MIT')
depends=('python' 'python-attrs' 'python-click')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://pypi.org/packages/source/${_pkgname:0:1}/${_pkgname/-/_}/${_pkgname/-/_}-${pkgver}.tar.gz"
        "qtoml-wrapper.py")
sha256sums=('06aac0e068d1d11c55b8c2df38625e589ad63847447fff8c53078e8d9db9935d'
            'ce8466672806fea59f8490c137b7a9d613b51b502d18a4b368d8142b20bde5e7')
b2sums=('6720dec6b2b0270d54ab1c41369747a5494e2142936380cb82b85bc289c62d7ce695fa136d2330e69bc93793339feaf134a7e81c245eb693fec727fff8540796'
        '02786a9166bb14a794688b3371631e86e4e5d8787269ffd9bdb4661ea97552d40333bc7bbe244dd9277145b4e58c5e4a2afe8eb7ec58fdda50a13db04adc294a')

build() {
  cd "${_pkgname/-/_}-${pkgver}"

  python setup.py build
}

package() {
  cd "${_pkgname/-/_}-${pkgver}"

  python setup.py install --root="${pkgdir}" --optimize=1

  rm -f "${pkgdir}/usr/bin"/*
  install -Dm0755 ../qtoml-wrapper.py "${pkgdir}/usr/bin/qtoml"

  install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
