# Maintainer: Timur Kiyivinski <timur@linux.com>

pkgname=kitematic-git
pkgver=2129.ece9cfa
pkgrel=1
pkgdesc='Visual Docker Container Management'
arch=('x86_64')
url='https://github.com/docker/kitematic'
license=('Apache')
depends=('docker' 'nodejs')
makedepends=('git' 'npm' 'nodejs-grunt-cli')
conflicts=('kitematic')
source=("$pkgname::git+https://github.com/docker/kitematic.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
    cd "$pkgname"
    npm install
    grunt babel less copy:dev shell:linux_npm electron-packager:build
}

package() {
    install -dm755 "$pkgdir"/{opt,usr/bin}
    cp -R "$pkgname/dist/Kitematic-linux-x64/" "$pkgdir/opt/$pkgname"
    ln -s "$pkgdir/opt/$pkgname/Kitematic" "$pkgdir/usr/bin/kitematic"
}
