# Maintainer: Lara Maia <dev@lara.monster>

pkgname=python-stlib
_name=${pkgname#python-}
pkgver=2.1
pkgrel=1
pkgdesc="Async library that provides features related to Steam client and compatible stuffs"
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url="https://github.com/calendulish/stlib"
depends=('python>=3.9' 'python-aiohttp' 'python-beautifulsoup4' 'python-rsa' 'steamworks-sdk')
optdepends=('python-stlib-plugins: A set of official plugins for stlib')
makedepends=('python-build' 'python-installer' 'python-wheel' 'gcc')
license=('GPL')
source=("https://github.com/calendulish/$_name/archive/v$pkgver.tar.gz")
sha256sums=('200c5ec3f37ca752f8f96015a1b12703f0f898613617a10681593eed19c3a893')

build() {
    cd "$_name-$pkgver"
    export SDK_PATH=/opt/steamworks-sdk
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
