# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

_pkgname=qtoml
pkgname="python-${_pkgname}"
pkgver=0.3.1
pkgrel=1
pkgdesc="New TOML encoder/decoder"
arch=('any')
url="https://pypi.org/project/${_pkgname}"
license=('MIT')
depends=('python' 'python-attrs' 'python-click')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://pypi.org/packages/source/${_pkgname:0:1}/${_pkgname/-/_}/${_pkgname/-/_}-${pkgver}.tar.gz"
        "qtoml-wrapper.py")
sha256sums=('7f2d0c2c39659d2a408ae93d02a068e0d22eb67e16e474239f7735ff1094b1ba'
            'ce8466672806fea59f8490c137b7a9d613b51b502d18a4b368d8142b20bde5e7')
b2sums=('03c2382cec0f3264a885a3639b7d62373fba33d4c3907006c5aad1fab5015d974c77bfcef1a5b6e411f57e8e7528513722b021f6b750a43abd231186a4885ef7'
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
