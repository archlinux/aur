# Maintainer: Nick77 <qwiko20@tutamail.com>

pkgname=jarvis-llm
pkgver=0.1
pkgrel=1
pkgdesc='jsrvis, a cli llm client'
arch=('any')
url='https://github.com/Catalina-sys456/jarvis-llm'
license=('MIT')
depends=('python'
	 'python-yaml'
	 'python-ollama'
	 'python-google-genai')
makedepends=('python-build'
	     'python-installer'
	     'python-wheel'
	     'python-hatchling')
source=(        
  $pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz)
sha512sums=('e19900ee0aefd39f21218a1e35e70d6c62b6b5b0823ed19ce18375d7a35b0a18b0f68dfef30131f5503871a4c5d891a0fc4eba121e09f9cdde853a387e3d6dcb')

build(){
    cd $pkgname-$pkgver
    python -m build --wheel --no-isolation
}

package(){
    cd $pkgname-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE $pkgdir/usr/share/licenses/${pkgname%-*}/LICENSE
    install -Dm644 config.yaml ~/config/jarvis/config.yaml
}
