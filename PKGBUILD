# Maintainer: Lara Maia <dev@lara.monster>

pkgname=python-stlib
_name=${pkgname#python-}
pkgver=1.1.1
pkgrel=1
pkgdesc="Async library that provides features related to Steam client and compatible stuffs"
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url="https://github.com/ShyPixie/stlib"
depends=('python>=3.9' 'python-aiohttp' 'python-beautifulsoup4' 'python-rsa' 'steamworks-sdk')
optdepends=('python-stlib-plugins: A set of official plugins for stlib')
makedepends=('python-build' 'python-installer' 'python-wheel' 'gcc')
license=('GPL')
source=("https://github.com/ShyPixie/$_name/archive/v$pkgver.tar.gz")
sha256sums=('b22d84cfc4645a8710d8df24ef377c12304b0e02eb8e35c924c65578eda86c8e')

build() {
    cd "$_name-$pkgver"
    export SDK_PATH=/opt/steamworks-sdk
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
