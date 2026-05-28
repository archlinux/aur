# Maintainer: Augustin Gjini <augustin.gjini@gmail.com>

pkgname=comtrya-bin
_pkgname=comtrya

# TODO: align pkgver with the upstream release tag once published.
# Current Cargo.toml declares 0.1.0 but no release exists yet — see issue
# https://github.com/comtrya/comtrya/issues/60
pkgver=0.1.0
pkgrel=1
pkgdesc="Schema-first forge prototype (precompiled binary)"
arch=('x86_64')
url="https://github.com/comtrya/comtrya"
license=('unknown')  # TODO: upstream has no LICENSE file yet — update once added
provides=("${_pkgname}")
conflicts=("${_pkgname}")

# TODO: update _asset to match the release asset name once upstream publishes one.
# Common patterns produced by cargo-dist / typical Rust release CI:
#   comtrya-cli-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz
#   comtrya-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz
#   comtrya-${pkgver}-linux-x86_64.tar.gz
_asset="comtrya-cli-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz"

source_x86_64=("${url}/releases/download/v${pkgver}/${_asset}")
sha256sums_x86_64=('SKIP')  # TODO: replace SKIP with the real sha256 once the release is published
                            #       updpkgsums  # convenient helper after editing the URL

package() {
    # Adjust the path below if upstream ships the binary at the archive root
    # or inside a versioned directory.
    install -Dm755 "${srcdir}/comtrya-cli" "${pkgdir}/usr/bin/comtrya-cli"

    # Provide a `comtrya` shim so users can invoke it under the conventional name.
    ln -s comtrya-cli "${pkgdir}/usr/bin/comtrya"
}
