# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=odrive
pkgver=0
pkgrel=2
pkgdesc="Sync agent and cli for odrive.com"
arch=(i686 x86_64)
url="https://www.odrive.com/"
license=('CUSTOM')
depends=('python2')
makedepends=('dos2unix')
options=("!strip")
source=("odrive-$pkgver-$pkgrel.py::http://dl.odrive.com/odrive-py"
        "odriveagent.sh"
        "odrive.service"
        "odrive@.service")
source_i686=("odriveagent-i686-$pkgver-$pkgrel.tar.gz::http://dl.odrive.com/odriveagent-lnx-32")
source_x86_64=("odriveagent-x86_64-$pkgver-$pkgrel.tar.gz::http://dl.odrive.com/odriveagent-lnx-64")
sha256sums=('165393924b0e5a73c5c3432496a99e515e8f4e8c159dd11fa416786bd476d260'
            '84420c036a7950ed9d72121affdca35da307016d6f2432eb94fcc39f27fc27de'
            'd93eb7df52e958e310049c38390b132e14a8012018e70c5ff6d2ec1aa7c1d302'
            '98f6738354acebcefdb22286de4cf134747517b1086f889c4cee41ed63d9ba56')
sha256sums_i686=('96fcaefc0db7b864325f20a5a0a20bfcdec5e3457a8913a2b07db6cd6a725f29')
sha256sums_x86_64=('73e7067635969fb9965ccc86980cd9f42d2b13a44b3026adf12e2f288d41d3e2')

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
