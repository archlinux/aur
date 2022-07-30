# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

_pkgname=devtools
pkgname="python-${_pkgname}"
pkgver=0.9.0
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
sha256sums=('f07ac07236953ecf6593392c8e1d732a151044fc5f37b9905672d033bc45b4ed'
            '95ee67b1fdcfb0df2740c0499f33564cbbfd87fb20d7e4ecbc38f6e25282b28e')
b2sums=('4e8245724f6275131e1a5925022c8a4e0da9333f9df01cc20bab3cf2bc180ef9a80802a20b39ad2627440d8264b13cc79612cae60bc0789c3b53b21266f99e1f'
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
