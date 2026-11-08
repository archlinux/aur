# Maintainer: Robin Trioux <robin@trioux.eu>

pkgname=mistral-vibe-bin
pkgver=3.1.0
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
source_x86_64=("https://files.pythonhosted.org/packages/97/69/4cc92fe98532638cf8fb1cfc4ee0a0142d7533ed1a0be5330b84081a19c2/mistral_vibe-${pkgver}-cp312-abi3-manylinux_2_28_x86_64.whl")
source_aarch64=("https://files.pythonhosted.org/packages/84/72/32667291072a592f6160ed7fab3c6e809c4fb3e51c69aaf40ea651e50866/mistral_vibe-${pkgver}-cp312-abi3-manylinux_2_28_aarch64.whl")
sha256sums_x86_64=('214f2e6a392e0d057087fe0c706c9617bc0bcacea593a19b166b79a7ac05233c')
sha256sums_aarch64=('0c7156062b65b957a22148277804c1a5127c7b9feea2060e84b7dd9cd65e9709')
noextract=("mistral_vibe-${pkgver}-cp312-abi3-manylinux_2_28_x86_64.whl"
           "mistral_vibe-${pkgver}-cp312-abi3-manylinux_2_28_aarch64.whl")

package() {
    # The wheel ships entry_points.txt (vibe, vibe-acp, vibe-app-server):
    # python-installer generates the /usr/bin scripts, including /usr/bin/vibe,
    # which imports vibe.cli.launcher:main and execs vibe/_bin/vibe-rs.
    # No manual script assembly is needed anymore.
    python -m installer --destdir="$pkgdir" "${srcdir}"/*.whl
}
