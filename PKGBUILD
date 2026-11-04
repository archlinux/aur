# Maintainer: czyt <czytcn@gmail.com>
pkgname=hc-bin
pkgver=0.1.17
pkgrel=1
pkgdesc="herdr-core (hc) — background server that keeps Herdr terminals and coding agents running (prebuilt, static)"
arch=('x86_64' 'aarch64')
url="https://herdr.dev/core/"
license=('Apache-2.0')
depends=()
provides=("herdr-core=${pkgver}")
# Installs the same files as herdr-core-bin, so the two must not coexist.
# herdr-bin (the Herdr supervisor) is a separate component and may stay.
conflicts=("herdr-core-bin" "herdr-core")
options=('!strip' '!debug')

# Upstream publishes no GitHub Releases: versions live in the
# releases.herdr.dev manifest and download URLs are version-pinned.
_pkg="herdr-core-linux"
source=("LICENSE-${pkgver}::https://raw.githubusercontent.com/herdrdev/herdr-core/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::https://releases.herdr.dev/core/${pkgver}/${_pkg}-x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::https://releases.herdr.dev/core/${pkgver}/${_pkg}-aarch64.tar.gz")
sha256sums=('c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4')
sha256sums_x86_64=('82ec44043f6894bfdb716b979b87cda43fd7fa46b0104e7b7bd93e64d1a9b877')
sha256sums_aarch64=('3a37a454ec63494cf4306db26481fe9db96673d888723701d24f8a992ae8ab8c')

package() {
    install -Dm755 "${srcdir}/herdr-core" "${pkgdir}/usr/bin/herdr-core"
    # Upstream install.sh only creates the hc alias when no hc is present;
    # in a package the alias is always ours to own.
    ln -s herdr-core "${pkgdir}/usr/bin/hc"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}"         "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
