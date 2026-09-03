# Maintainer: Lex Black <autumn-wind at web dot de>
# Contributor: patlefort <northon_patrick3 at yahoo dot ca>
# Contributor: Daniel Larsson <znixen@live.se>

pkgname=patool
pkgver=4.0.7
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
sha256sums=('08dcb019997f55aa730a873185aeddbb397e2be757157769721942784cb4a97f')


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
