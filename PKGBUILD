# Maintainer: Tobias Burdow <kaleidox@comroid.org>

pkgname=mc-server-hub-git
pkgver=0.1
pkgrel=3
pkgdesc="A web-interface for managing Minecraft Servers"
arch=('any')
url="https://github.com/comroid-git/mc-server-hub"
license=('GPL-3.0')
depends=('java-runtime>=17' 'screen' 'tar' 'grep' 'sed' 'curl' 'jq' 'coreutils' 'findutils')
makedepends=('java-environment>=17' 'gradle>=7')
source=("git+https://github.com/comroid-git/mc-server-hub.git" "git+https://github.com/comroid-git/mc-server-hub-git.git")
md5sums=('SKIP' 'SKIP')
options+=("!strip")

build() {
    cd mc-server-hub
    gradle simplifyDist
}

package() {
    mkdir "/etc/mc-server-hub"
    install -d "/etc/mc-server-hub"
    install -Dm755 "mc-server-hub/build/dist/mc-server-hub.war" "/usr/lib/mc-server-hub.war"
    install -Dm644 "mc-server-hub-git/mc-server-hub.service" "/usr/lib/systemd/system/mc-server-hub.service"
}
