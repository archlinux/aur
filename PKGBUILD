# Maintainer: Sergey Safonov <spoof-arch@spoofa.info>
pkgname=jefferson
pkgver=0.4.2
pkgrel=1
pkgdesc="JFFS2 filesystem extraction tool"
url="https://github.com/onekey-sec/jefferson"
arch=(any)
license=(MIT)
depends=('python-cstruct>=5' 'python-lzo>=1.14' 'python-click>=8.1'})
makedepends=(python-{build,installer,wheel})
provides=(${pkgname})
conflicts=("${pkgname}-git")
source=("https://github.com/onekey-sec/jefferson/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('bdbcfbbbf723cc6782b96f08af346d4aa1c32ae9b78ad8fb16ad6446f09377d9ae3968c59118476e90acc306170235163b3e974906e6b53fc2e6ece74de8ee3e')

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/$pkgname-$pkgver-*.whl
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
