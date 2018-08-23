# Maintainer: Alexander Korzun <korzun.sas@mail.ru>
pkgname=modbox
pkgver=0.1_pre_dev
pkgrel=1
pkgdesc="A 3D game where modules loaded in runtime control most of gameplay"
arch=(x86_64)
url="https://github.com/kodo-pp/ModBox"
license=('MIT')
depends=('irrlicht')
provides=('modbox')
conflicts=('modbox-git')
source=(
    "$pkgname-$pkgver.tar.gz::https://github.com/kodo-pp/ModBox/archive/$pkgver.tar.gz"
    "https://github.com/kodo-pp/ModBox/releases/download/$pkgver/start-installed-modbox.sh"
)
md5sums=('1e65ef7ecf9e0cc2a8c123e36c658a7d'
         '49846d29c0f44849b043e6888b9c5cc4')
sha256sums=('d972d8f01fbf9d1328a12bc58920503199f2cd073135c18d716ec2968e0a7c5d'
            'd761cb52f9c77c7abd3b9d926a2719cc07ffd00efa1ddb12ec12c65b81eee0f4')

build() {
    cd "ModBox-$pkgver"
    CC_TOOLCHAIN=gcc FORCE_REBUILD=yes DEBUG=no ./build.sh
}

package() {
    cd "ModBox-$pkgver"
    mkdir -p "$pkgdir/opt/ModBox"
    cp -r textures "$pkgdir/opt/ModBox"
    chmod -R 1777 "$pkgdir/opt/ModBox/textures"
    install -Dm755 main "$pkgdir/opt/ModBox/modbox"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm755 ../start-installed-modbox.sh "$pkgdir/usr/bin/modbox"
}
