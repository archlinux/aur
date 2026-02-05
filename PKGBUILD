# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>

_pyname=deepl
pkgname=python-${_pyname}
pkgver=1.28.0
pkgrel=1
pkgdesc='Python library for the DeepL API'
arch=(any)
url="https://github.com/${_pyname}com/${_pyname}-python"
license=(MIT)
depends=(python-requests)
makedepends=(git 
             python-{build,installer,wheel}
             python-poetry-core)
optdepends=('python-keyring: for support storing API Key')
source=("git+$url.git?signed#tag=v$pkgver")
validpgpkeys=('D84A62C6CA4D3E3D6656083438FCACAAFD2C06B8'  # Jan Ebbing <Jan.Ebbing@deepl.com>
              'DBDC63E97C526204335805941FA7A782EC90634E'  # Daniel Jones <daniel.jones@deepl.com> (@daniel-jones-dev)
              '352C00301BFFB7346807D3F48D109F2777EDE78F'  # Jason Gardella <jason.gardella@deepl.com> (@jason-gardella-deepl)
              '320B842A5BBF81C5C08AC880EBA3EA088712B620'  # Brianna Delgado <brianna.delgado@deepl.com> (@BriannaDelgado)
              '8081F8A3C01CD680B2AF98B564AB78B6A11D8222'  # Brianna Delgado <brianna.delgado@deepl.com> (@BriannaDelgado)
              '8FE39865F20E9B0DADEF7B00B7F1A94E099738CD'  # Leon Cheng <leonc@alum.mit.edu> (@leoncheng57)
              '7E7DC2C6F2E67A2C5E7B418606C6A25989EC87F1') # Leon Cheng <leon.cheng@deepl.com> (@leoncheng57)
sha256sums=('842443a904860d02252f538dac586bb5e7d9ebdf00d69c4850388fc8eae994a4')

build() {
	cd "$_pyname-python"
	python -m build -wn
}

package() {
	cd "$_pyname-python"
	python -m installer -d "$pkgdir" dist/*.whl
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
