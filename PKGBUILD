# Maintainer: Lara Maia <dev@lara.monster>

pkgname=python-stlib
_name=${pkgname#python-}
pkgver=2.0.1
pkgrel=1
pkgdesc="Async library that provides features related to Steam client and compatible stuffs"
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url="https://github.com/calendulish/stlib"
depends=('python>=3.9' 'python-aiohttp' 'python-beautifulsoup4' 'python-rsa' 'steamworks-sdk')
optdepends=('python-stlib-plugins: A set of official plugins for stlib')
makedepends=('python-build' 'python-installer' 'python-wheel' 'gcc')
license=('GPL')
source=("https://github.com/calendulish/$_name/archive/v$pkgver.tar.gz")
sha256sums=('120b3eb563fc62c5d8ffd863b790d83ae8b4f8b4e48a9adca2c8f2a1fc7e5e80')

build() {
    cd "$_name-$pkgver"
    export SDK_PATH=/opt/steamworks-sdk
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
