# Maintainer: Sefa Eyeoglu <contact@scrumplex.net>
# Contributor: Daniel Maslowski <info@orangecms.org>

pkgname=fisher-git
pkgver=3.1.1.r0.ge9925f4
pkgrel=1
pkgdesc="A blazing fast, modern plugin manager for fish"
arch=("any")
url="https://github.com/jorgebucaran/fisher"
license=("MIT")
depends=("fish>=2.3.0" "curl" "git")
makedepends=("git")
conflicts=("fisherman" "fisherman-git" "fisher")
install=fisher-git.install
source=(
    "git+https://github.com/jorgebucaran/fisher.git"
)
sha512sums=(
    "SKIP"
)

pkgver() {
    cd "fisher"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    sharepath="${pkgdir}/usr/share"
    fishpath="${sharepath}/fish"
    # install Fisherman into the global fish directory
    cd "fisher"
    install -Dm 644 fisher.fish "${fishpath}/vendor_functions.d/fisher.fish"
    # README and LICENSE
    install -Dm 644 LICENSE.md "${sharepath}/licenses/${pkgname}/LICENSE.md"
    install -Dm 644 README.md "${sharepath}/doc/${pkgname}/README"
}
