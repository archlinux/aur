# Maintainer: wereii <me+aur at wereii.cz>
# Contributor: FD <fxd@seznam.cz>

pkgname=nomachine-enterprise-client
pkgver=7.10.1
_x64_rel=1
_i686_rel=1
pkgrel=1
pkgdesc="Remote desktop application, client only"
groups=('network')
url="http://www.nomachine.com"
license=('custom:"NoMachine EULA"')
arch=('x86_64' 'i686')
options=('!strip')
conflicts=(nomachine nxmanager nxwebplayer nxnode nxclient)
install=nomachine-client.install
backup=(etc/NX/player/localhost/{player,client}.cfg)

source=(player.cfg client.cfg nomachine-client)
sha256sums=(SKIP SKIP SKIP)

source_x86_64=("http://download.nomachine.com/download/${pkgver%*.*}/Linux/${pkgname}_${pkgver}_${_x64_rel}_x86_64.tar.gz")
source_i686=("http://download.nomachine.com/download/${pkgver%*.*}/Linux/${pkgname}_${pkgver}_${_i686_rel}_i686.tar.gz")

sha256sums_x86_64=('d8fa1fb80792e2d429592c24ca9100ddd3c16796cb321426674bd7a7163c84c3')
sha256sums_i686=('3afdfa337d11496167ebfc41edf6e92ddf19f3c4c3314a78be866b5698d29f67')

package()
{
    mkdir -p "${pkgdir}/etc/NX/player/localhost"
    install -Dm644 player.cfg client.cfg -t "${pkgdir}/etc/NX/player/localhost"

    install -dm777 "${pkgdir}/media/nomachine"

    install -Dm755 nomachine-client -t "${pkgdir}/usr/bin"

    mkdir -p "${pkgdir}/usr/share"

    cd "${pkgdir}/usr/share"
    tar -xzf "${srcdir}/NX/etc/NX/player/packages/nxclient.tar.gz"
    tar -xzf "${srcdir}/NX/etc/NX/player/packages/nxplayer.tar.gz"
}
