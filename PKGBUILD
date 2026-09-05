# Maintainer: Lex Black <autumn-wind at web dot de>
# Contributor: patlefort <northon_patrick3 at yahoo dot ca>
# Contributor: Daniel Larsson <znixen@live.se>

pkgname=patool
pkgver=4.1.0
pkgrel=1
pkgdesc="portable command line archive file manager"
arch=('any')
url="https://wummel.github.io/patool/"
license=('GPL-3.0-only')
depends=(python)
makedepends=(python-build python-installer python-wheel python-setuptools-reproducible python-argcomplete)
optdepends=("lz4: extracting LZ4 archives"
    "7zip: extracting various not natively supported formats (upstream suggested)"
    "unarchiver: extracting various not natively supported formats"
    "unrar: extracting RAR files")
source=(https://github.com/wummel/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha256sums=('54c669b2af0f5e46d59a53f02ca4f83d53b3a7a25d50e97778582da7cea65daf')


build() {
  cd "${pkgbase}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${pkgbase}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -dm755 "${pkgdir}/usr/share/bash-completion/completions"
  register-python-argcomplete patool > "${pkgdir}/usr/share/bash-completion/completions/patool"

  install -Dm644 'doc/patool.1' -t "${pkgdir}/usr/share/man/man1"
}
