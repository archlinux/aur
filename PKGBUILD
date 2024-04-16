# Maintainer 2021: Nadya <nadyushka228@riseup.net>
# Maintainer 2022-: spyophobia <76800505+spyophobia@users.noreply.github.com>
pkgname=cloak-obfuscation-bin
pkgver=2.9.0
pkgrel=1
pkgdesc='A pluggable transport that works alongside traditional proxy tools like OpenVPN to evade deep-packet-inspection based censorship (binary version)'
arch=('x86_64' 'arm' 'aarch64')
url='https://github.com/cbeuw/Cloak'
license=('GPL3')
provides=('cloak-obfuscation')
conflicts=("cloak-obfuscation" "cloak-obfuscation-git")
source=("cloak-obfuscation-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
source_x86_64=(
    "${url}/releases/download/v${pkgver}/ck-client-linux-amd64-v${pkgver}"
    "${url}/releases/download/v${pkgver}/ck-server-linux-amd64-v${pkgver}"
)
source_arm=(
    "${url}/releases/download/v${pkgver}/ck-client-linux-arm-v${pkgver}"
    "${url}/releases/download/v${pkgver}/ck-server-linux-arm-v${pkgver}"
)
source_aarch64=(
    "${url}/releases/download/v${pkgver}/ck-client-linux-arm64-v${pkgver}"
    "${url}/releases/download/v${pkgver}/ck-server-linux-arm64-v${pkgver}"
)

sha512sums=('baab36cae7306b6d54c56c616fe1f8af151f8f61887f46c04fcc0f97fbff3bb4e233fe7cab73e3a4bc8fe2e08698ba734a8e90ecf0745d62844df2ecb1fe6ba8')
sha512sums_x86_64=('916ccac7efdcc00821f7d22a5d36e461a7a049249511d4d76d2f1869167a323295e4cd4b5859c3dee87e6c01118d0880329f0496c34f2d0e6b88fc289cbe7600'
                   '42c3a2bfba46556559c71c06d89b62f5b1cc64015ad37634d2dee28efac600a8965531e08f4fb85cbe7cb76ba7434d627bd9088866e8dad340e013705d975d97')
sha512sums_arm=('ffc577364251bdad0cbc0723d59627de3ae46f3d8f4fd1ca5459f37fcf80db52ef5991cfad244b59c6a654338d2abfc52f362123d0814a8c7f716b9248b53cdf'
                'c7cd9f8894d7fee3c19aaabb4f17ebee0b7946bf74c662bdad9241b9c2ad22417a41b64ef4a3ddb97124690e4e6d761366aa6c98c125a3cf03df4c598c8345f7')
sha512sums_aarch64=('1bca79b8e3e82df3cfd45134fdf12e73aa2350c19f366ad27c2dc0af57cee2d301d5a568cd39400c61712a658424042117e750a9603cbf4b535fb84f5f0e6531'
                    'c7fd66e1a2c2d9e33a904c3a19446e2c3fc4a6c1f084c780da5be18c6d74385ab52c930f2d5937408b01ef044e3fbe3d8fffea4669f748daf2d7e545f458b8a5')

backup=(
    'etc/cloak/ckclient.json'
    'etc/cloak/ckserver.json'
)

package() {
    cd "${srcdir}"
    install -Dm 755 "ck-client-linux-amd64-v${pkgver}" "${pkgdir}/usr/bin/ck-client"
    install -Dm 755 "ck-server-linux-amd64-v${pkgver}" "${pkgdir}/usr/bin/ck-server"

    cd "${srcdir}/Cloak-${pkgver}/example_config"
    install -Dm 644 -t "${pkgdir}/etc/cloak" ckclient.json ckserver.json
}
