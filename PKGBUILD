# Maintainer: Robin Trioux <robin@trioux.eu>

pkgname=mistral-vibe-bin
pkgver=3.1.3
pkgrel=1
pkgdesc='Minimal CLI coding agent by Mistral (binary release)'
arch=('x86_64' 'aarch64')
url='https://github.com/mistralai/mistral-vibe'
license=(Apache-2.0)
provides=("mistral-vibe=${pkgver}")
conflicts=('mistral-vibe')
depends=(
    "python"
    "python-agent-client-protocol"
    "python-anyio"
    "python-authlib"
    "python-cachetools"
    "python-certifi"
    "python-charset-normalizer"
    "python-croniter"
    "python-dateutil"
    "python-dotenv"
    "python-gitpython"
    "python-giturlparse"
    "python-google-auth"
    "python-httpx"
    "python-httpx2"
    "python-jsonpatch"
    "python-jsonpointer"
    "python-keyring"
    "python-mcp"
    "python-miniaudio"
    "python-mistralai"
    "python-opentelemetry-api"
    "python-opentelemetry-exporter-otlp"
    "python-opentelemetry-sdk"
    "python-opentelemetry-semantic-conventions"
    "python-pydantic"
    "python-pydantic-settings"
    "python-rfc8785"
    "python-sentry_sdk"
    "python-setproctitle"
    "python-tomli-w"
    "python-tree-sitter"
    "python-tree-sitter-bash"
    "python-truststore"
    "python-uuid-utils"
    "python-watchfiles"
    "python-yaml"
)
makedepends=("python-installer")
# Use the official manylinux_2_28 wheels: they bundle the prebuilt Rust
# artifacts (vibe/_bin/vibe-rs TUI and the mistralai_vibe_local_harness
# native extension) and only need glibc >= 2.28.
source_x86_64=("https://files.pythonhosted.org/packages/fd/4d/c3fd7a70dfd55f0aa9d014a06e8c9828fbee69b7d838ac40177354adb835/mistral_vibe-${pkgver}-cp312-abi3-manylinux_2_28_x86_64.whl")
source_aarch64=("https://files.pythonhosted.org/packages/50/9a/fff15fa127805658f35a9363be4b89fd649d475754baf6e041ae870f9795/mistral_vibe-${pkgver}-cp312-abi3-manylinux_2_28_aarch64.whl")
sha256sums_x86_64=('2fd68bbfc7cf1c6bbefda77ced7e9ea38b216693c1696ed9d155388499e3d923')
sha256sums_aarch64=('97a52e8aa59cb2fab456fe9a0c01634e14f407191c54a1e6502d63a1a12eec63')
noextract=("mistral_vibe-${pkgver}-cp312-abi3-manylinux_2_28_x86_64.whl"
           "mistral_vibe-${pkgver}-cp312-abi3-manylinux_2_28_aarch64.whl")

package() {
    # The wheel ships entry_points.txt (vibe, vibe-acp, vibe-app-server):
    # python-installer generates the /usr/bin scripts, including /usr/bin/vibe,
    # which imports vibe.cli.launcher:main and execs vibe/_bin/vibe-rs.
    # No manual script assembly is needed anymore.
    python -m installer --destdir="$pkgdir" "${srcdir}"/*.whl
}
