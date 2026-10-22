# Maintainer: chabandou <chabandou@gmail.com>
pkgname=poise-bin
# Keep in step with version in pyproject.toml (release checklist there)
pkgver=1.5.0
pkgrel=3
pkgdesc="Real-time system audio denoiser and voice isolator with TUI (prebuilt binary)"
arch=('x86_64')
url="https://github.com/chabandou/Poise-Voice-Isolator"
license=('MIT')
depends=(
    'glibc'
    'libpulse'  # pulse-simple backend (PortAudio is not used on Linux)
)
provides=('poise')
conflicts=('poise')

# NOTE: the asset name carries pkgrel on purpose. Each pkgrel bump is a
# distinct URL/filename, so AUR helpers can never reuse a stale cached
# download (same-URL re-uploads always fail the new sha256sums check and
# force users into --rebuild). Keep uploading the plain `poise` asset too
# for manual curl installs; only the pkgrel-named one is packaged here.
source=("poise-${pkgver}-${pkgrel}::${url}/releases/download/v${pkgver}/poise-${pkgver}-${pkgrel}")
sha256sums=('0302ab0182ebd26db71869fce6f7f1dc4dbcf85c80b3368c42e360d6542a974d')

# Don't strip the binary - Nuitka onefile binaries get corrupted by strip
options=('!strip')

package() {
    install -Dm755 "$srcdir/poise-${pkgver}-${pkgrel}" "$pkgdir/usr/bin/poise"
}
