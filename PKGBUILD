# Maintainer: robertoszek <robertoszek@robertoszek.xyz>
pkgname=python-pleroma-bot
_name=${pkgname#python-}
pkgver=1.0.0.post1
pkgrel=1
pkgdesc="Bot for mirroring one or multiple Twitter accounts in Pleroma/Mastodon."
arch=("any")
url="https://github.com/robertoszek/$_name"
license=("MIT")
depends=("python")
makedepends=("python-setuptools")
conflicts=("${pkgname}" "${pkgname}-git")
source=("pleroma-bot-1.0.0.tar.gz")
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=("c4d381ffc4a70ad160f432e4bb1d2eef1c3b5f56d4f3ef91375ed2cc6bb2761e")

build() {
  cd "${srcdir}/${_name}-${pkgver}"
  # python setup.py build
  python -m setuptools.launch setup.py build
}

package() {
  depends=("python-oauthlib" "python-requests-oauthlib" "python-requests" "python-pyaml")
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1 || return 1
}
