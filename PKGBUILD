# Maintainer: Sergey Safonov <spoof-arch@spoofa.info>
pkgname=jefferson
pkgver=0.4.3
pkgrel=1
pkgdesc="JFFS2 filesystem extraction tool"
url="https://github.com/onekey-sec/jefferson"
arch=(any)
license=(MIT)
depends=('python>=3.8' 'python-cstruct>=5' 'python-lzallright>=0.1' 'python-click>=8.1'})
makedepends=(python-{build,installer,wheel})
provides=(${pkgname})
conflicts=("${pkgname}-git")
source=("https://github.com/onekey-sec/jefferson/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('90d073cb0b63a0d9d4742f5dd085a2690f683615c95b339b3461bf275f3a645e796e220dcdaf2b8e19e3ee304c9c96ce1cb34943a4e50b7c0176169095d718e5')

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/$pkgname-$pkgver-*.whl
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
