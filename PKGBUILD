# Maintainer: Sergey Safonov <spoof-arch@spoofa.info>
pkgname=jefferson
pkgver=0.4.5
pkgrel=2
pkgdesc="JFFS2 filesystem extraction tool"
url="https://github.com/onekey-sec/jefferson"
arch=(any)
license=(MIT)
depends=('python>=3.8' 'python-cstruct>=5.2' 'python-lzallright>=0.2.1' 'python-click>=8.1'})
makedepends=(python-{build,installer,wheel})
provides=(${pkgname})
conflicts=("${pkgname}-git")
source=("https://github.com/onekey-sec/jefferson/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('bce25b616e3e3ab97d6c646b63cd117f4dd7340353b8014d3b1d03107d43374e')

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/$pkgname-$pkgver-*.whl
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
