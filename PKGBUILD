# Maintainer: Acidhub <dev@acidhub.click>

pkgname=stlib
pkgver=0.4.1
pkgrel=1
pkgdesc="Async library that provides features related to Steam client and compatible stuffs"
arch=('x86_64')
url="https://github.com/ShyPixie/stlib"
depends=('python>=3.6' 'python-aiohttp' 'python-beautifulsoup4' 'python-rsa')
optdepends=('python-aiodns: For speeding up DNS resolving by WebAPI'
            'python-cchardet: For speeding up Character Encoding')
makedepends=('python-setuptools' 'gcc' 'unzip')
license=('GPL')
source=("https://github.com/ShyPixie/$pkgname/archive/v$pkgver.tar.gz"
        'steamworks_sdk_142.zip::file://steamworks_sdk_142.zip'
        'depends.patch')
sha256sums=('fa938adfee9d471f509a5c44c4a70f911238b4d4b0c23275e3098b8848063af6'
            '7695f8e183bef16dc2e663ffbdfad2248ae266bce8ff42066a3e88e1d54f0f42'
            '2a0644bc1ea14bc82facf36c57e43144b8ede344cf0ea03ba3a5375b34559eb9')

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


