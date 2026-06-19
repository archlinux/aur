# Maintainer: indyfive11 <203553604+indyfive11@users.noreply.github.com>
pkgname=gabagent
pkgver=0.5.1
pkgrel=1
pkgdesc="Claude Code-style AI coding assistant built on the Gab AI Developer API"
arch=('any')
url="https://github.com/indyfive11/gabagent"
license=('GPL-3.0-or-later')
depends=(
  'python>=3.12'
  'python-openai'
  'python-rich'
  'python-prompt_toolkit'
  'python-httpx'
  'python-html2text'
  'python-typer'
  'python-pydantic'
  'python-pydantic-settings'
  'python-anyio'
  'python-jsonlines'
  'python-ddgs'
)
# Voice mode runs gabagent as the BRAIN (gab --voice-serve); the starlette/uvicorn optdepends below enable
# it. The hands-free voice FRONT-END (microphone, wake word, STT/TTS) is a separate project, voice-agent,
# which has no AUR package yet — install it from https://github.com/indyfive11/voice-agent. The brain works
# standalone over its HTTP+SSE protocol regardless.
optdepends=(
  'python-playwright: headless browser support for JS-rendered pages'
  'python-anthropic: Claude/Anthropic backend (/backend claude)'
  'python-starlette: voice mode brain (gab --voice-serve)'
  'python-uvicorn: voice mode brain (gab --voice-serve)'
)
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-hatchling')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('033f7d8224499932198c5703ea16fc08bd3a856104c2374a3fedb9ff5dd8902b')

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
