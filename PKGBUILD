# Maintainer: Alexander Korzun <korzun.sas@mail.ru>
pkgname=modbox
pkgver=0.3
pkgrel=1
pkgdesc="A 3D game where modules loaded in runtime control most of gameplay"
arch=(x86_64)
url="https://github.com/kodo-pp/ModBox"
license=('MIT')
makedepends=('boost')
depends=('irrlicht' 'python' 'boost-libs' 'coreutils')
source=(
    "$pkgname-$pkgver-$pkgrel.tar.gz::https://github.com/kodo-pp/ModBox/archive/v0.3.tar.gz"
    "https://github.com/kodo-pp/ModBox/releases/download/v0.3/start-modbox.sh"
)
md5sums=('389b175ba275a86a30cc02e1e6b44713'
         'edfef5b85484de3e5aa4707f9d4a62fb')
sha256sums=('26f2d26e71686e752f21c9afd22e2661c6a1ffc7c5c737bf0a2c8abf5f30c530'
            '92e22381915507c482c6915c011649063c610ef417d64f55a77480ba7b63d262')

build() {
    cd "ModBox-0.3"
    CC_TOOLCHAIN=gcc FORCE_REBUILD=yes DEBUG=no ./build.sh
}

package() {
    cd "ModBox-$pkgver"
    mkdir -p "$pkgdir/opt/ModBox"
    cp -r textures "$pkgdir/opt/ModBox"
    cp -r modules "$pkgdir/opt/ModBox"
    cp -r pymodbox "$pkgdir/opt/ModBox"
    mkdir "$pkgdir/opt/ModBox/saves"
    chmod -R 1777 "$pkgdir/opt/ModBox/textures"
    chmod -R 1777 "$pkgdir/opt/ModBox/modules"
    chmod -R 1777 "$pkgdir/opt/ModBox/saves"
    install -Dm755 main "$pkgdir/usr/bin/modbox-exe"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm755 ../start-modbox.sh "$pkgdir/usr/bin/modbox"
}
