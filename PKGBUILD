# Maintainer: Livaco <livaco@livaco.dev>
pkgname=crab-fetch
pkgver=0.4.0
pkgrel=2
pkgdesc="Extremely fast, featureful and customizable command-line fetcher."
arch=('x86_64')
url="https://github.com/LivacoNew/CrabFetch"
license=('Apache-2.0')
depends=("glibc" "gcc-libs")
optdepends=("mesa-utils" "pciutils" "libdrm" "dbus")
makedepends=("rustup")
provides=("crabfetch")
conflicts=("crabfetch")
source=("https://github.com/LivacoNew/CrabFetch/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('82cb2909e2d9449c79644f88fadfa6b8521623a9cbb54fbd49abf869fe5b1a042709fa9a8d3602ab5405090557700ad1132fc3de739d7a3d9ff8f17e369057cd')

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
