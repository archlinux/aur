# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

_pkgname=devtools
pkgname="python-${_pkgname}"
pkgver=0.11.0
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
sha256sums=('81d7d6aaf3deb5fcc2874e62ff6361940068ad04e0ca282958e6e857e39b1741'
            '95ee67b1fdcfb0df2740c0499f33564cbbfd87fb20d7e4ecbc38f6e25282b28e')
b2sums=('9c95e5f652b5bea39c14d663195cd680eff9fee828e58d577681f462883e41a862b39227acbd8b5101f64f6a5b135cc47de3602fd6432335f0975c90ec4722a7'
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
