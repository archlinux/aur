# Maintainer: wereii <me+aur at wereii.cz>
# Contributor: FD <fxd@seznam.cz>

pkgname=nomachine-enterprise-client
pkgver=7.9.2
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

sha256sums_x86_64=('7e743675c61ddce615fa2dd6064c7362acfd553aa69655205c36867eedaa0d7c')
sha256sums_i686=('3ae415fa20ca3d1b028cdf70cfcef6d91bc780122ce97ce85f5d9c6aa4514aba')

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
