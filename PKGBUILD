# Maintainer: Robin Trioux <robin@trioux.eu>

pkgname=mistral-vibe-bin
pkgver=3.1.1
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
)
makedepends=("python-installer")
# Upstream publishes no sdist; the official manylinux_2_28 wheels bundle the
# prebuilt Rust artifacts (vibe/_bin/vibe-rs TUI and the
# mistralai_vibe_local_harness native extension) and only need glibc >= 2.28.
source_x86_64=("https://files.pythonhosted.org/packages/ab/a0/6298a532a2117f9b7e55545145a331f859edafe846af1ac71acbc65a657d/mistral_vibe-${pkgver}-cp312-abi3-manylinux_2_28_x86_64.whl")
source_aarch64=("https://files.pythonhosted.org/packages/84/86/84e43a5846d04f310e048fe3790cac7e604f7347024286f4a016060daf98/mistral_vibe-${pkgver}-cp312-abi3-manylinux_2_28_aarch64.whl")
sha256sums_x86_64=('79d4481eb6136d32bd92de30f1126c3c4aa70c7322b5b56a5672cb5df00866e0')
sha256sums_aarch64=('b085b954583fe740f5ab8f97d928e2670530820a5335576081714db8e33e7b4b')
noextract=("mistral_vibe-${pkgver}-cp312-abi3-manylinux_2_28_x86_64.whl"
           "mistral_vibe-${pkgver}-cp312-abi3-manylinux_2_28_aarch64.whl")

package() {
    # The wheel ships entry_points.txt (vibe, vibe-acp, vibe-app-server):
    # python-installer generates the /usr/bin scripts, including /usr/bin/vibe,
    # which imports vibe.cli.launcher:main and execs vibe/_bin/vibe-rs.
    # No manual script assembly is needed anymore.
    python -m installer --destdir="$pkgdir" "${srcdir}"/*.whl
}
