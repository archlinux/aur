# Maintainer: chabandou <chabandou@gmail.com>
pkgname=poise-bin
pkgver=1.1.0
pkgrel=10
pkgdesc="Real-time system audio denoiser and voice isolator with TUI (prebuilt binary)"
arch=('x86_64')
url="https://github.com/chabandou/Poise-Voice-Isolator"
license=('MIT')
depends=(
    'glibc'
    'libpulse'
)
provides=('poise')
conflicts=('poise')
optdepends=('rnnoise: RNNoise engine (same model as EasyEffects)')

# NOTE: the asset name carries pkgrel on purpose. Each pkgrel bump is a
# distinct URL/filename, so AUR helpers can never reuse a stale cached
# download (same-URL re-uploads always fail the new sha256sums check and
# force users into --rebuild). Keep uploading the plain `poise` asset too
# for manual curl installs; only the pkgrel-named one is packaged here.
source=("poise-${pkgver}-${pkgrel}::${url}/releases/download/v${pkgver}/poise-${pkgver}-${pkgrel}")
sha256sums=('0916bb4e00b4f197d900f2799520f18f8e102029e6de0a0326b7910d652ad5b6')

# Don't strip the binary - Nuitka onefile binaries get corrupted by strip
options=('!strip')

package() {
    install -Dm755 "$srcdir/poise-${pkgver}-${pkgrel}" "$pkgdir/usr/bin/poise"
}
