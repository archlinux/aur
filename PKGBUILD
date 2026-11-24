# Maintainer: Robin Trioux <robin@trioux.eu>

pkgname=mistral-vibe-bin
pkgver=3.1.5
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
source_x86_64=("https://files.pythonhosted.org/packages/c8/d2/31f6a4d2c1ae98046a27659c92b4690bfd344ef020eee68e6b08cee96199/mistral_vibe-${pkgver}-cp312-abi3-manylinux_2_28_x86_64.whl")
source_aarch64=("https://files.pythonhosted.org/packages/cf/35/aef44eb7c3b1a69a4c552b881177bad3e92e09942429f2bb7517be109c7d/mistral_vibe-${pkgver}-cp312-abi3-manylinux_2_28_aarch64.whl")
sha256sums_x86_64=('ff9237c3457ef74341fd99f1847649d769d976f3f93bba2a31f950369303e7ca')
sha256sums_aarch64=('3d84b4e4c809fec8800c8d3f7bf677453f5fb5a729a7b5b83ceaef706f9945f2')
noextract=("mistral_vibe-${pkgver}-cp312-abi3-manylinux_2_28_x86_64.whl"
           "mistral_vibe-${pkgver}-cp312-abi3-manylinux_2_28_aarch64.whl")

package() {
    # The wheel ships entry_points.txt (vibe, vibe-acp, vibe-app-server):
    # python-installer generates the /usr/bin scripts, including /usr/bin/vibe,
    # which imports vibe.cli.launcher:main and execs vibe/_bin/vibe-rs.
    # No manual script assembly is needed anymore.
    python -m installer --destdir="$pkgdir" "${srcdir}"/*.whl
}
