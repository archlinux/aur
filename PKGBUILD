# Maintainer: Luke Bubar <luke at coldmail dot xyz>

pkgname=llama-websearch
pkgver=0.1.0
pkgrel=1
pkgdesc="Local llama.cpp chat that searches the web through your own SearXNG (llama-server web UI + MCP)"
arch=('any')
url="https://aur.archlinux.org/packages/llama-websearch"
license=('MIT')
depends=(
  'llama-cpp'      # llama-server and its web UI, which has the MCP client
  'ggml-vulkan'    # Vulkan backend for ggml: runs on AMD cards without ROCm
  'vulkan-driver'  # your GPU's Vulkan driver (vulkan-radeon for AMD)
  'mcp-searxng'    # AUR: exposes SearXNG to the model as a search tool
  'python'         # runs SearXNG in a per-user virtualenv
  'git'            # fetches SearXNG on first run
  'curl'           # startup and health checks
)
optdepends=('vulkan-tools: vulkaninfo, for troubleshooting the GPU')
install=llama-websearch.install
source=('llama-websearch'
        'config.default'
        'searxng-settings.yml'
        'LICENSE')
sha256sums=('60c45c1f5b0352ef23adc10cf1368cf744feb2a495d6bcd65d55f232399cb194'
            'ee3a6b46b1c343e14dc7d9ab6d30bc9682a8d417063eb2cd3f5e29cfeb035397'
            'ff75346360dd39f0b0dd61cf562f979dabf3a8cd129c1011d70d09a8709b7aca'
            '515a76839167687e62cbc8ca8248b44747abc617de65df6c37649e2958dff66f')

package() {
  install -Dm755 llama-websearch "$pkgdir/usr/bin/llama-websearch"
  install -Dm644 config.default "$pkgdir/usr/share/llama-websearch/config.default"
  install -Dm644 searxng-settings.yml "$pkgdir/usr/share/llama-websearch/searxng-settings.yml"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
