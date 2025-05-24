# Maintainer: wereii <me+aur at wereii.cz>
# Contributor: FD <fxd@seznam.cz>

pkgname=nomachine-enterprise-client
pkgver=9.0.188
_x64_rel=16
_i686_rel=16
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
source_x86_64=("http://download.nomachine.com/download/${pkgver%*.*}/Linux/${pkgname}_${pkgver}_${_x64_rel}_x86_64.tar.gz")
source_i686=("http://download.nomachine.com/download/${pkgver%*.*}/Linux/${pkgname}_${pkgver}_${_i686_rel}_i686.tar.gz")

sha256sums=('05cd2ff2a6b613f0502d0abbf8f063b6fbd4f06f6a4ff6ba55756fabe11afd8e'
            '81489fe47c19685bc06cc3a0bc35ade4915a36d80b550608e952c675f1c0e3d8'
            'f6c071ad1d4b167fd3395536baabf954e6bd8d567e734bb5a58eacaaab15e9a1')
sha256sums_x86_64=('e9954ff4cb61fad738c7f118e78e7cb5fbbebb3d5172a4f2f2f422efb6560e1c')
sha256sums_i686=('e9954ff4cb61fad738c7f118e78e7cb5fbbebb3d5172a4f2f2f422efb6560e1c')



package()
{
    mkdir -p "${pkgdir}/etc/NX/player/localhost"
    install -Dm644 player.cfg client.cfg -t "${pkgdir}/etc/NX/player/localhost"

    install -dm777 "${pkgdir}/media/nomachine"

    install -Dm755 nomachine-client -t "${pkgdir}/usr/bin"

    mkdir -p "${pkgdir}/usr/share"

    cd "${pkgdir}/usr/share"
    tar -xzf "${srcdir}/NX/etc/NX/player/packages/nxrunner.tar.gz"
    tar -xzf "${srcdir}/NX/etc/NX/player/packages/nxplayer.tar.gz"
}
