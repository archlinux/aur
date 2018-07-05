# Maintainer: Acidhub <dev@acidhub.click>

pkgname=stlib
pkgver=0.5
pkgrel=1
pkgdesc="Async library that provides features related to Steam client and compatible stuffs"
arch=('x86_64')
url="https://github.com/ShyPixie/stlib"
depends=('python>=3.6' 'python-aiohttp' 'python-beautifulsoup4' 'python-rsa')
optdepends=('python-aiodns: For speeding up DNS resolving by WebAPI')
makedepends=('python-setuptools' 'gcc' 'unzip')
license=('GPL')
source=("https://github.com/ShyPixie/$pkgname/archive/v$pkgver.tar.gz"
        'steamworks_sdk_142.zip::file://steamworks_sdk_142.zip'
        'depends.patch')
sha256sums=('d7c82872a6999d16539b000b9a1efddb712e93aefa4d9e7157df646dce9c71a0'
            '7695f8e183bef16dc2e663ffbdfad2248ae266bce8ff42066a3e88e1d54f0f42'
            'de8d395516cb56f8e39e83d1aae31a322c56fce790d49e9a4b5539b456f2c142')

prepare() {
    cp -R sdk/* "$pkgname-$pkgver/src/steam_api/steamworks_sdk/"
    cd $pkgname-$pkgver
    ls ../
    patch -uN setup.py ../depends.patch || return 1
}

build() {
    cd $pkgname-$pkgver
    python setup.py build
}

package() {
    cd $pkgname-$pkgver
    python setup.py install --skip-build --optimize=1 --root="$pkgdir/"
}


