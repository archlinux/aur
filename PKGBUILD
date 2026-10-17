# Maintainer: Andrew Mello <andrew@88plug.com>
pkgname=k3d-gpu
pkgver=0.1.26
pkgrel=1
pkgdesc="Bootstrap GPU-ready k3d clusters: launcher + NVIDIA device plugin manifest for k3s on Docker"
arch=('any')
url="https://github.com/88plug/k3d-gpu"
license=('custom:FSL-1.1-ALv2')
depends=('bash')
optdepends=(
    'docker: container runtime for the cluster'
    'k3d-git: k3d CLI to manage clusters'
    'kubectl: query and apply manifests'
    'nvidia-container-toolkit: GPU container runtime for Docker'
    'python: k3d-gpu-mcp (the MCP server for AI agents), k3d-gpu facts, plan and audit'
)
source=("git+https://github.com/88plug/k3d-gpu.git#tag=aur-v${pkgver}")
sha256sums=('SKIP')

package() {
    cd "$srcdir/$pkgname"
    install -Dm755 scripts/k3d-gpu              "$pkgdir/usr/bin/k3d-gpu"
    install -Dm755 scripts/k3d-gpu-mcp          "$pkgdir/usr/bin/k3d-gpu-mcp"
    install -Dm644 share/nvidia-device-plugin.yml "$pkgdir/usr/share/k3d-gpu/nvidia-device-plugin.yml"
    install -Dm644 share/intel-gpu-plugin.yml   "$pkgdir/usr/share/k3d-gpu/intel-gpu-plugin.yml"
    install -Dm644 share/intel-gpu-wsl-plugin.yml "$pkgdir/usr/share/k3d-gpu/intel-gpu-wsl-plugin.yml"
    install -Dm644 share/intel-gpu-dra.yml      "$pkgdir/usr/share/k3d-gpu/intel-gpu-dra.yml"
    install -Dm644 share/intel-npu-plugin.yml   "$pkgdir/usr/share/k3d-gpu/intel-npu-plugin.yml"
    install -Dm644 share/intel-dsa-plugin.yml   "$pkgdir/usr/share/k3d-gpu/intel-dsa-plugin.yml"
    install -Dm644 share/nri-balloons.yml       "$pkgdir/usr/share/k3d-gpu/nri-balloons.yml"
    install -Dm644 share/intel-iaa-plugin.yml   "$pkgdir/usr/share/k3d-gpu/intel-iaa-plugin.yml"
    install -Dm644 share/intel-qat-plugin.yml   "$pkgdir/usr/share/k3d-gpu/intel-qat-plugin.yml"
    install -Dm644 share/gaudi-device-plugin.yml "$pkgdir/usr/share/k3d-gpu/gaudi-device-plugin.yml"
    install -Dm644 share/agent-chat-ui.yml      "$pkgdir/usr/share/k3d-gpu/agent-chat-ui.yml"
    install -Dm644 share/npu-embeddings.yml     "$pkgdir/usr/share/k3d-gpu/npu-embeddings.yml"
    install -Dm644 share/node-feature-discovery.yml "$pkgdir/usr/share/k3d-gpu/node-feature-discovery.yml"
    local f
    for f in share/telemetry/*.yml share/telemetry/optional/*.yml; do
        install -Dm644 "$f" "$pkgdir/usr/share/k3d-gpu/${f#share/}"
    done
    for f in facts.py plan.py report_html.py audit.py schema_check.py facts.v1.schema.json matrix.v1.json; do
        install -Dm644 "console/$f" "$pkgdir/usr/share/k3d-gpu/console/$f"
    done
    install -Dm644 images.lock "$pkgdir/usr/share/k3d-gpu/images.lock"
    install -Dm644 README.md  "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 LICENSE.md    "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
