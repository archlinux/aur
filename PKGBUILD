# Maintainer: Livaco <livaco@livaco.dev>
pkgname=crab-fetch
pkgver=0.5.4
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
sha512sums=('74dd0f7bbc1ea4930b47dd226dc2c8f0d69474bc9ee39516820f2eb1de50deeea611745a05493b6629b9156d2374b1a3da1c030883221cf5227b8ac419501f8b')

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
