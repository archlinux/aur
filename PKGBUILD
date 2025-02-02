# Maintainer: Livaco <livaco@livaco.dev>
pkgname=crab-fetch
pkgver=0.5.2
pkgrel=1
pkgdesc="Extremely fast, featureful and customizable command-line fetcher."
arch=('x86_64')
url="https://github.com/LivacoNew/CrabFetch"
license=('Apache-2.0')
depends=("glibc" "gcc-libs" "pciutils")
optdepends=("libdrm: Provides better accuracy for AMD GPUs" "dbus: Required for the music module")
makedepends=("rustup")
provides=("crabfetch")
conflicts=("crabfetch")
source=("https://github.com/LivacoNew/CrabFetch/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('442794d0c3f6ba11b2a87b8c3f22b2a5f00fe4034a7128a6cc817264852e2e81f3718f0a55858c021e114826b93969f28eaff242be63b105fa471c309894b413')

build() {
	cd "${srcdir}/CrabFetch-${pkgver}"

    # If you don't want to use dbus, remove the music feature flag!
    # Since this is an *arch* package, I'm assumign you are however
    cargo build -r -F music
}

package() {
	cd "${srcdir}/CrabFetch-${pkgver}"
    # hardcoded "crabfetch" cus the package name is different
    install -Dm 755 ./target/release/crabfetch ${pkgdir}/usr/bin/crabfetch
    install -Dm 755 ./LICENCE ${pkgdir}/usr/share/licenses/crabfetch/LICENCE
}
