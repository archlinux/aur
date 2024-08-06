# Maintainer: Livaco <livaco@livaco.dev>
pkgname=crab-fetch-git
pkgver=v0.4.2.r0.g87c1941
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
source=("$pkgname::git+https://github.com/LivacoNew/CrabFetch")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"
    git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "${srcdir}/${pkgname}"
    # If you don't want to use dbus, remove the music feature flag!
    # Since this is an *arch* package, I'm assumign you are however
    cargo build -r -F music
}

package() {
	cd "${srcdir}/${pkgname}"
    # hardcoded "crabfetch" cus the package name is different
    install -Dm 755 ./target/release/crabfetch ${pkgdir}/usr/bin/crabfetch
    install -Dm 755 ./LICENCE ${pkgdir}/usr/share/licenses/crabfetch/LICENCE
}
