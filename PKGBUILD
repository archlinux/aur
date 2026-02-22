# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: George Angelopoulos <george@usermod.net>

pkgname=xsos
pkgver=0.7.33
pkgrel=1
pkgdesc="Instantly summarize system info from a sosreport or a running system"
arch=('any')
url="https://github.com/ryran/xsos"
license=('GPL-3.0')
depends=('bash' 'gawk' 'sed')
optdepends=('dmidecode: for bios info'
            'ethtool: for network interface data')
source=("https://github.com/ryran/xsos/archive/v${pkgver}.tar.gz")
md5sums=('f4421fc6fe4e5209dbbd6db53e1b62bd')

prepare() {
    cd "${pkgname}-${pkgver}"

    sed -i -e 's/runlevel=$(runlevel)/runlevel=$(systemctl get-default)/g' xsos
}

package() {
    cd "${pkgname}-${pkgver}"

    install -Dm755 xsos "${pkgdir}/usr/bin/xsos"

    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"

    install -Dm644 xsos-bash-completion.bash "${pkgdir}/usr/share/bash-completion/completions/xsos"
}
