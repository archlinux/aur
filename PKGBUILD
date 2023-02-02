# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

_pkgname=devtools
pkgname="python-${_pkgname}"
pkgver=0.10.0
pkgrel=1
pkgdesc="Python's missing debug print command and other development tools."
arch=('any')
url="https://pypi.org/project/${_pkgname}"
license=('MIT')
depends=('python' 'python-asttokens' 'python-executing')
optdepends=('python-pygments: Code highlighting')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-hatchling')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/samuelcolvin/python-devtools/archive/v${pkgver}.tar.gz"
        LICENSE)
sha256sums=('7716c446035dd0236a48cba2f12d43a39cafe8c5dcf7d01f751ebe6794689ffd'
            '95ee67b1fdcfb0df2740c0499f33564cbbfd87fb20d7e4ecbc38f6e25282b28e')
b2sums=('acc45a46c0bb0685b35e4cd5d6bbdd2f6ad1c1f7365a7d51c0c56c1c5e2aef94711ec49c29157f1cd56ba172a2d3a48ccaeb7e3022ca01b3aa995e9dd6fa53d8'
        '5c26d1be5d4ee3c05ac90a8118a23de7ebde909290075cc7c1df4acab355f06417e5a32052f56e313ddaa7cc16d4cfb721c9931dffe58105917180bcae40b719')

build() {
  cd "python-devtools-${pkgver}"

  python -m build --wheel --no-isolation
}

package() {
  cd "python-devtools-${pkgver}"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
