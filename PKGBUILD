# Maintainer: Sefa Eyeoglu <contact@scrumplex.net>
# Contributor: Daniel Maslowski <info@orangecms.org>

_branch=master

pkgname=fisher-git
pkgver=3.2.6.r1.gae878a8
pkgrel=1
pkgdesc="A package manager for the fish shell"
arch=("any")
url="https://github.com/jorgebucaran/fisher"
license=("MIT")
depends=("fish>=2.3.0" "curl" "git")
makedepends=("git")
conflicts=("fisher")
install=fisher-git.install
source=(
    "git+https://github.com/jorgebucaran/fisher.git#branch=${_branch}"
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
    # README
    install -Dm 644 README.md "${sharepath}/doc/${pkgname}/README"
}
