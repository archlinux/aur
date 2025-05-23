# Maintainer: Gavin Luo <lunt.luo#gmail.com>

pkgname=js-design-agent-bin
pkgver=20241115
pkgrel=1
pkgdesc='即时设计本地字体助手'
url='https://js.design/'
arch=('aarch64')
provides=("${pkgname%-bin}")
source=('install.patch')
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.tar.gz::https://img.js.design/assets/download/jsDesignAgent.tar.gz")
b2sums=('606e3e218a1a3718e29d2180067414225683d8f0af0a91a9cb3c1d96b71132d56d74f44681ea0b0a4d4a576e56560ddb3fabeca1d9c572b71668d40f1c5e0de7')
b2sums_aarch64=('9916b9f1c7fd91ebae4d11c02a6ff89fe225108949cd492ad7cbecf67e3ab83cf8ae192551408b2e5e96876943d5945542a0136eb9c1147938ab45e7de2542b6')
depends=('fontconfig')

prepare() {
    cd "${srcdir}/jsDesignAgent"
    patch -p1 < "${srcdir}/install.patch"
    bash ./install.sh
    echo 'u js-design-agent - "即时设计本地字体服务" - -' > js-design-agent.sysusers
}

package() {
    cd "${srcdir}/jsDesignAgent"
    install -Dm755 jsDesignAgent            -t "${pkgdir}/usr/bin/"
    install -Dm644 jsDesignAgent.service    -t "${pkgdir}/usr/lib/systemd/system/"
    install -Dm644 js-design-agent.sysusers    "${pkgdir}/usr/lib/sysusers.d/js-design-agent.conf"
}
