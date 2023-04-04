# Maintainer: Lara Maia <dev@lara.monster>

pkgname=python-stlib
_name=${pkgname#python-}
pkgver=1.3.1
pkgrel=1
pkgdesc="Async library that provides features related to Steam client and compatible stuffs"
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url="https://github.com/calendulish/stlib"
depends=('python>=3.9' 'python-aiohttp' 'python-beautifulsoup4' 'python-rsa' 'steamworks-sdk')
optdepends=('python-stlib-plugins: A set of official plugins for stlib')
makedepends=('python-build' 'python-installer' 'python-wheel' 'gcc')
license=('GPL')
source=("https://github.com/calendulish/$_name/archive/v$pkgver.tar.gz")
sha256sums=('05a7f0d6f01bda2da68b73e7a41f9bac3bc16abcf7e87b16fb44474840a451a6')

build() {
    cd "$_name-$pkgver"
    export SDK_PATH=/opt/steamworks-sdk
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
