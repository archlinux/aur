# Maintainer: Livaco <livaco@livaco.dev>
pkgname=crab-fetch
pkgver=0.4.2
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
sha512sums=('9c88910e9c1386842aac393c26f8778e85e9c028f925a68499eec3945ebc5e6a0d80fa65b40dc1aab8788f8548dcd5ba01612dd5f794a6237db3cf255b7306cb')

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
