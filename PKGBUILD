# Maintainer: Zack Taylor <zdt1997 at gmail dot com>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=odrive
pkgver=939
pkgrel=1
pkgdesc="Sync agent and cli for odrive.com"
arch=('x86_64')
url="https://www.odrive.com/"
license=('CUSTOM')
depends=('python2')
makedepends=('dos2unix')
options=("!strip")
source=("odrive-$pkgver-$pkgrel.py::http://dl.odrive.com/odrive-py"
        "odriveagent-x86_64-$pkgver-$pkgrel.tar.gz::https://dl.odrive.com/odriveagent-lnx-64"
        "odriveagent.sh"
        "odrive.service"
        "odrive@.service")
sha256sums=('35bb477634edcb835eb094777737f1da0f2981f40f1fe13fe9924f472b76aed9'
            '1fcc7c4d141ba34a74312b4ae4ca9452bad2b5aab007eb7402ef950469a59054'
            '84420c036a7950ed9d72121affdca35da307016d6f2432eb94fcc39f27fc27de'
            '73decc1a5c9ef76ecc224b07ad3ba2791373117d84de43e430eabe8c91e2380a'
            '98f6738354acebcefdb22286de4cf134747517b1086f889c4cee41ed63d9ba56')

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
