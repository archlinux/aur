# Maintainer: Mekyt <hello at mek dot yt>

_pkgname='kratos'
pkgname='kratos-bin'
pkgver=1.0.0
pkgrel=1
pkgdesc='Ory kratos identity server'
arch=('x86_64')
url='https://github.com/ory/kratos'
license=('Apache 2.0')
depends=()
makedepends=()
optdepends=()
source=(
    "${_pkgname}-${pkgver}.tar.zst::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}-linux_64bit.tar.gz"
    'config.yml'
    'identity.schema.json'
    "${_pkgname}.service"
    "${_pkgname}.sysusers"
)
backup=('etc/kratos/config.yml' 'etc/kratos/identity.schema.json')
sha512sums=('2ce68bf0005bcafecbfce62744049893709d50db3988df8f88e95b5b3e6ad0b910c88ce8853a0ba963469e3a6370be97a48504c426d9a0bbfb75551ae58b1609'
            '4c0883cfbca4a9b8b980765d5b2ea78d16d2695076bfbec87afc3e4702eeed3b102fdbc4f33375ccf55d4dcc642b4415aee2c58bc6ab8848f55b2e4a80c988a1'
            'be61a2b00ffd162e5bbb0e17ac96a2090aad3d9b45744fbc7756ea4a7eafcfcdfba6da5dd152dc46cb27d59ab6ec7507a726527864f759a3090f9f274e66d869'
            'e385eca7df6b94695f23ceadbe4526878b9e7f34159587ac07beb50ebf73baa270c701a4319dd5455ff355c9f5c7da279f3260637dcd650ef0f7e49aebd00138'
            '803d345a553b05c36e0c8b015d0f320e84b2e1fcf0e84e35732db028868f368cbb76e5e775c3d32af25a9fe072595c81a2aa79f2cc84711d811778f9880fa12a')

package() {
    install -Dm755 ${srcdir}/${_pkgname} -t "${pkgdir}"/usr/bin/
    install -Dm644 ${_pkgname}.service -t "${pkgdir}"/usr/lib/systemd/system/
    install -Dm644 ${_pkgname}.sysusers "${pkgdir}"/usr/lib/sysusers.d/${_pkgname}.conf
    install -Dm644 config.yml "${pkgdir}"/etc/kratos/config.yml
    install -Dm644 identity.schema.json "${pkgdir}"/etc/kratos/identity.schema.json
}
