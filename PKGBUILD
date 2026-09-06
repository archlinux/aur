# Maintainer: Lumina Nao <luminanao at duck.com>
# AUR AGENT: publish this file WHOLESALE (plus regenerated .SRCINFO).
# Do NOT bump pkgver in a stale AUR copy - that has shipped broken source
# refs, missing deps, and missing options three times. Verify after publish:
# llama-launcher/utils/check-aur-sync.sh must report OK for all packages.
pkgname=llama-launcher
pkgver=25
pkgrel=1
pkgdesc="Helper scripts for building llama.cpp and running llama-server with per-model configs, launch history, benchmarking, and SSH tunneling"
arch=(any)
url="https://codeberg.org/LuminaNAO/llama-launcher"
license=(AGPL-3.0-only)
depends=('bash' 'cmake' 'curl' 'git' 'jq' 'yq' 'bc' 'nodejs' 'openssh')
optdepends=(
    'llama-hdd: llama-server binary (required to launch models)'
)
source=(git+https://codeberg.org/LuminaNAO/${pkgname}.git#tag="v${pkgver}")
sha256sums=(SKIP)

package() {
    install -Dm755 "${pkgname}/install.sh" "${pkgdir}/usr/bin/llama-launcher-install"
    install -Dm755 "${pkgname}/llama-server-launcher.sh" "${pkgdir}/usr/bin/llama-launcher"
    ln -sf llama-launcher "${pkgdir}/usr/bin/llama-launcher-log"
    install -Dm755 "${pkgname}/download-model.sh" "${pkgdir}/usr/bin/llama-download-model"
    install -Dm755 "${pkgname}/build-llamacpp.sh" "${pkgdir}/usr/bin/llama-build"
    install -Dm755 "${pkgname}/utils/install-service.sh" "${pkgdir}/usr/bin/llama-install-service"
    install -Dm755 "${pkgname}/utils/ssh-tunnel.sh" "${pkgdir}/usr/bin/llama-ssh-tunnel"
    install -Dm755 "${pkgname}/llama-waterfall.sh" "${pkgdir}/usr/bin/llama-waterfall"
    install -Dm755 "${pkgname}/utils/mlock-fixer.sh" "${pkgdir}/usr/bin/llama-mlock-fixer"
    install -Dm755 "${pkgname}/utils/benchmark.sh" "${pkgdir}/usr/bin/llama-benchmark"
    install -Dm755 "${pkgname}/utils/bench-batch-sizes.sh" "${pkgdir}/usr/bin/llama-bench-batch-sizes"
    install -Dm755 "${pkgname}/utils/benchmark-backends.sh" "${pkgdir}/usr/bin/llama-benchmark-backends"
    install -Dm755 "${pkgname}/utils/load-test.sh" "${pkgdir}/usr/bin/llama-load-test"
    install -Dm755 "${pkgname}/utils/soak-test-v3b.sh" "${pkgdir}/usr/bin/llama-soak-test"
    install -Dm755 "${pkgname}/utils/vram-stress-test.sh" "${pkgdir}/usr/bin/llama-vram-stress-test"
    install -Dm755 "${pkgname}/llama-deep-proxy.mjs" "${pkgdir}/usr/lib/llama-launcher/llama-deep-proxy.mjs"
    install -Dm755 "${pkgname}/llama-waterfall.mjs" "${pkgdir}/usr/lib/llama-launcher/llama-waterfall.mjs"
    # Bundled tunes + chat templates, read from BUNDLED_MODEL_CONFIG_DIR
    install -Dm644 "${pkgname}"/model-configs/* -t "${pkgdir}/usr/share/llama-launcher/model-configs"
    install -Dm644 "${pkgname}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 "${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${pkgname}/docs/CACHE-RAM.md" "${pkgdir}/usr/share/doc/${pkgname}/CACHE-RAM.md"
}
