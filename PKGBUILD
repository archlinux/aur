# Maintainer: Benigno Batista Jr <benignobjunior@gmail.com>
# Contributor: Fukumakoto Kure <kure dot fukukmakoto dot at gmail dot com>
pkgname=jira-cli-bin
pkgdesc='Feature-rich interactive Jira command line.'
pkgver=1.7.0
pkgrel=2
arch=('x86_64' 'i686' 'aarch64' 'armv6h')
url='https://github.com/ankitpokhrel/jira-cli'
license=('MIT')
provides=('jira')
conflicts=('jira-cli')
source=("README.md-v${pkgver}::${url}/raw/v${pkgver}/README.md")
source_x86_64=("${url}/releases/download/v${pkgver}/jira_${pkgver}_linux_x86_64.tar.gz")
source_i686=("${url}/releases/download/v${pkgver}/jira_${pkgver}_linux_i386.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/jira_${pkgver}_linux_arm64.tar.gz")
source_armv6h=("${url}/releases/download/v${pkgver}/jira_${pkgver}_linux_armv6.tar.gz")
sha256sums=('ddd2aa179f5ed715a237897264892d32e7e4b79c2ff3cf7f8cb3bf6fb19b7bc1')
sha256sums_x86_64=('b5e0ba4804f3f11f92c483d9a6ea9ebccec1c735cd2e12b0440cab9d7afd626a')
sha256sums_i686=('e0136f58465a13ca059e87b58d0e97eedb26080c271b743d55ba6aadf43a793f')
sha256sums_aarch64=('80aa3cc02790892b29e1580a8e49eb49a6550815b362c5ef8c05aea1dee73a95')
sha256sums_armv6h=('05e17dbf67e74f9919ac27c9f8d185fc916a1b9c01767edf01588f478f3eaf38')

package() {
    local x86_64=x86_64 i686=i386 aarch64=arm64 armv6h=armv6
    cd "jira_${pkgver}_linux_${!CARCH}/bin"

    install -Dm755 jira -t "${pkgdir}/usr/bin"
    install -Dm644 ../LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${srcdir}/README.md-v${pkgver}" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

    # shell completions
    ./jira completion bash | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/jira"
    ./jira completion zsh | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_jira"
    ./jira completion fish | install -Dm644 /dev/stdin "${pkgdir}/usr/share/fish/vendor_completions.d/jira.fish"
}
