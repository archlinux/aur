# Maintainer: Robin Trioux <robin@trioux.eu>

pkgname=mistral-vibe-bin
pkgver=3.0.4
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
    "python-pyperclip"
    "python-rfc8785"
    "python-rich"
    "python-sentry_sdk"
    "python-setproctitle"
    "python-textual"
    "python-tomli-w"
    "python-tree-sitter"
    "python-tree-sitter-bash"
    "python-truststore"
    "python-uuid-utils"
    "python-watchfiles"
    "python-yaml"
    "python-zstandard"
)
makedepends=("python-installer")
# Upstream publishes no sdist; the official manylinux_2_28 wheels bundle the
# prebuilt Rust artifacts (vibe/_bin/vibe-rs TUI and the
# mistralai_vibe_local_harness native extension) and only need glibc >= 2.28.
source_x86_64=("https://files.pythonhosted.org/packages/5a/7e/fd187351ac595dd5354f2118792f5624f7f1bda83bd8e47f4a4bc0ca930a/mistral_vibe-${pkgver}-cp312-abi3-manylinux_2_28_x86_64.whl")
source_aarch64=("https://files.pythonhosted.org/packages/80/2d/d31d7c0c4b00ac1b349714339fda061be4755ee1b6d1f09129ef4c4cf6ca/mistral_vibe-${pkgver}-cp312-abi3-manylinux_2_28_aarch64.whl")
sha256sums_x86_64=('fa201f53a8f7574435c1b911218a4a537e3678831f9cbd7791e5fb32658de956')
sha256sums_aarch64=('bdd52e926ebdb56caabab226987873574ec481bc1564b7fd911222cacb7b3d9d')
noextract=("mistral_vibe-${pkgver}-cp312-abi3-manylinux_2_28_x86_64.whl"
           "mistral_vibe-${pkgver}-cp312-abi3-manylinux_2_28_aarch64.whl")

package() {
    # The wheel ships entry_points.txt (vibe, vibe-acp, vibe-app-server):
    # python-installer generates the /usr/bin scripts, including /usr/bin/vibe,
    # which imports vibe.cli.launcher:main and execs vibe/_bin/vibe-rs.
    # No manual script assembly is needed anymore.
    python -m installer --destdir="$pkgdir" "${srcdir}"/*.whl
}
