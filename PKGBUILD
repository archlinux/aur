# Maintainer: Arne Beer <public@arne.beer>

pkgname=bois-git
pkgver=0.0.1
pkgrel=1
arch=('any')
pkgdesc='A task manager and scheduler for shell commands'
license=('MIT')
options=('!lto')
makedepends=('git' 'cargo')
conflicts=('bois')
provides=('bois')
url='https://github.com/Nukesor/bois'
source=("${pkgname}::git+https://github.com/Nukesor/bois.git")
sha256sums=('SKIP')

# Uncomment until we have a proper tag to reference
# pkgver() {
#   cd "$pkgname" || exit
#   version=$(git describe --long --tags --abbrev=7 | sed -r 's/([^-]*-g)/r\1/;s/-/./g')
#   # Strip the `v` from the created version tag
#   echo "${version:1}"
# }

build() {
    cd "$pkgname" || exit

    # Build the binary
    cargo build --release --locked
}

package() {
    cd "$pkgname" || exit

    # Install binaries
    install -Dm755 "target/release/bois" "${pkgdir}/usr/bin/bois"

    # Install License
    install -Dm644 "LICENSE.APACHE" "${pkgdir}/usr/share/licenses/bois/LICENSE.APACHE"
    install -Dm644 "LICENSE.MIT" "${pkgdir}/usr/share/licenses/bois/LICENSE.MIT"
}
