# Maintainer: Josh King <josh@throneless.tech>
# Contributor: Josh King <josh@throneless.tech>

pkgname="rke2-bin"
pkgver="1.25.9+rke2r1"
pkgrel="1"
pkgdesc="Rancher's next-generation Kubernetes distribution"
url="https://rke2.io"
license=("Apache")
arch=("x86_64")
conflicts=("rke2-git")
depends=("bash" "nm-cloud-setup")

source_x86_64=(
    "${pkgname}-${pkgver}-${CARCH}.tar.gz::https://github.com/rancher/rke2/releases/download/v${pkgver}/rke2.linux-amd64.tar.gz"
)

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
sha256sums_x86_64=('b09b1e65ad3275f900453507739375c25ec4491043a6b9302edf15c156291515')
