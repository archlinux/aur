# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=odrive
pkgver=0
pkgrel=1
pkgdesc="Sync agent and cli for odrive.com"
arch=(i686 x86_64)
url="https://www.odrive.com/"
license=('CUSTOM')
depends=('python2')
makedepends=('dos2unix')
source=("odrive-$pkgver-$pkgrel.py::http://dl.odrive.com/odrive-py"
        "odriveagent.sh"
        "odrive.service"
        "odrive@.service")
source_i686=("odriveagent-i686-$pkgver-$pkgrel.tar.gz::http://dl.odrive.com/odriveagent-lnx-32")
source_x86_64=("odriveagent-x86_64-$pkgver-$pkgrel.tar.gz::http://dl.odrive.com/odriveagent-lnx-64")
options=("!strip")

prepare() {
    cp odrive-$pkgver-$pkgrel.py odrive.py
    dos2unix odrive.py
    sed '1 s|bin/python$|bin/env python2|' -i odrive.py
}

package() {
    install -Dm755 odrive.py "$pkgdir"/usr/bin/odrive
    install -Dm755 odriveagent "$pkgdir"/usr/share/odrive/odriveagent
    install -Dm755 odriveagent.sh "$pkgdir"/usr/bin/odriveagent
    install -Dm755 odrive.service "$pkgdir"/usr/lib/systemd/user/odrive.service
    install -Dm755 odrive@.service "$pkgdir"/usr/lib/systemd/system/odrive@.service
}

sha256sums=('5dc57ad8bd08e157df7b7b6f90c1484c13bbc0c3185daceb6f1b0c04f47a021c'
            '84420c036a7950ed9d72121affdca35da307016d6f2432eb94fcc39f27fc27de'
            'd93eb7df52e958e310049c38390b132e14a8012018e70c5ff6d2ec1aa7c1d302'
            '98f6738354acebcefdb22286de4cf134747517b1086f889c4cee41ed63d9ba56')
sha256sums_i686=('5d7894b54719f791de6f452ee047cc72815e06bd45f59f96aca600f66d31edd2')
sha256sums_x86_64=('fe3277039d9e4d46bb110da1adbbffd37e7bcceda9164c2e74bc10ba80d40b5a')
