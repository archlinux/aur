# Maintainer: wereii <me+aur at wereii.cz>
# Contributor: FD <fxd@seznam.cz>

pkgname=nomachine-enterprise-client
pkgver=9.0.188
_x64_rel=11
_i686_rel=11
pkgrel=2
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
sha256sums_x86_64=('12da61ef41b6dc4cf53a86a7d63071ac2da9d12f4e37fe47f2f22a71bc19dd9e')
sha256sums_i686=('9cb45de2426e2c7efcf5c7d717915a9432cce547f2f163f34f20d1a32591f14b')



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
