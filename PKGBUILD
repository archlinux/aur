# Maintainer: Livaco <livaco@livaco.dev>
pkgname=crab-fetch
pkgver=0.5.3
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
sha512sums=('e84648b280a1666175ab77bb3af43dd1f7f0763a4014e4d8966dc2f054df65d7a7c01859562239ba08d484ea647aa68d460d660f8207f27106ee731539a21c18')

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
