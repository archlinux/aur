# Maintainer: Marek Darocha <aur@mdarocha.pl>
pkgname=omnisharp-roslyn-bundled
pkgver=1.37.6
pkgrel=1
pkgdesc="LSP server for C# - version with bundled mono"
arch=('x86_64')
url="https://github.com/OmniSharp/omnisharp-roslyn"
license=('MIT')
depends=()
provides=(${pkgname%-bundled})
conflicts=(${pkgname%-bundled})
noextract=('omnisharp-linux.tar.gz')
source=("omnisharp-linux.tar.gz::https://github.com/OmniSharp/omnisharp-roslyn/releases/download/v$pkgver/omnisharp-linux-x64.tar.gz"
        "run.patch")
sha256sums=('49b8600ea956d586defed72e74743d56f8de99126c154f7d700a4c06bea69970'
            '984052cf95ca95940c3beb9b14d05bdd0c1e207ea7cac455c347e2978e0319b1')
options=(!strip)

package() {
    mkdir -p "${pkgdir}/opt/${pkgname}"
    tar -xf "${srcdir}/omnisharp-linux.tar.gz" -C "${pkgdir}/opt/${pkgname}"

    patch "${pkgdir}/opt/${pkgname}/run" "${srcdir}/run.patch"

    chown -R root:root "${pkgdir}/opt/${pkgname}"

    mkdir -p "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/run" "${pkgdir}/usr/bin/omnisharp"
}

