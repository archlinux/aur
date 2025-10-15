# Maintainer: Quentin Michaud <mh4ckt3mh4ckt1c4s@archlinux.org>
# Contributor: Josh King <josh@throneless.tech>

pkgname="rke2-bin"
pkgver="1.32.2+rke2r1"
pkgrel="1"
pkgdesc="Rancher's next-generation Kubernetes distribution"
url="https://rke2.io"
license=("Apache-2.0")
arch=("x86_64")
provides=("rke2")
conflicts=("rke2")

source=(
    "${pkgname}-${pkgver}-x86_64.tar.gz::https://github.com/rancher/rke2/releases/download/v${pkgver}/rke2.linux-amd64.tar.gz"
)
b2sums=('cfb969327a5cb4f6b6f728139c2a18671c9cd192400a6f3a18d8652211d5325c9de1c8f566b3f65f12c6f3672458644a51c7496138d580bdc3382bd5b310cabd')

prepare() {
    sed -i -e 's/\/usr\/local/\/usr/g' -e 's/\/sbin/\/usr\/bin/g' $srcdir/lib/systemd/system/rke2-agent.service
    sed -i -e 's/\/usr\/local/\/usr/g' -e 's/\/sbin/\/usr\/bin/g' $srcdir/lib/systemd/system/rke2-server.service
}

package() {
    install -Dm 755 $srcdir/bin/rke2 $pkgdir/usr/bin/rke2
    install -Dm 755 $srcdir/bin/rke2-killall.sh $pkgdir/usr/bin/rke2-killall.sh

    install -Dm 644 $srcdir/lib/systemd/system/rke2-agent.service $pkgdir/usr/lib/systemd/system/rke2-agent.service
    install -Dm 644 $srcdir/lib/systemd/system/rke2-server.service $pkgdir/usr/lib/systemd/system/rke2-server.service
    install -Dm 644 $srcdir/lib/systemd/system/rke2-agent.env $pkgdir/usr/lib/systemd/system/rke2-agent.env
    install -Dm 644 $srcdir/lib/systemd/system/rke2-server.env $pkgdir/usr/lib/systemd/system/rke2-server.env

    install -Dm 644 $srcdir/share/rke2/LICENSE.txt $pkgdir/usr/share/rke2/LICENSE.txt
    install -Dm 644 $srcdir/share/rke2/rke2-cis-sysctl.conf $pkgdir/usr/share/rke2/rke2-cis-sysctl.conf
}
