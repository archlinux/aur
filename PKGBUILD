# Maintainer: Jason Go <jasongo@jasongo.net>

pkgname=specify-cli
pkgver=1.0.7
pkgrel=1
pkgdesc='Bootstrap and manage Spec Kit projects'
arch=('x86_64' 'aarch64')
url='https://github.com/github/spec-kit'
license=('MIT')
depends=(
  'python'
  'python-click'
  'python-json5'
  'python-packaging'
  'python-pathspec'
  'python-platformdirs'
  'python-pyyaml'
  'python-readchar'
  'python-rich'
  'python-typer'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-hatchling'
  'python-wheel'
)
optdepends=(
  'claude-code: Supported Agent'
  'codebuddy-cli: Supported Agent'
  'cursor-bin: Supported Agent, IDE-based'
  'gemini-cli: Supported Agent'
  'git-credential-manager-bin: For issues with Git authentication'
  'iflow-cli: Supported Agent'
  'kilocode-cli-bin: Supported Agent, IDE-based'
  'kimi-cli: Supported Agent'
  'kiro-cli: Supported Agent'
  'mistral-vibe: Supported Agent'
  'openai-codex: Supported Agent'
  'opencode: Supported Agent'
  'qodercli-bin: Suported Agent'
  'pi-coding-agent: Supported Agent'
  'qwen-code: Supported Agent'
  'shai: Supported Agent'
  'tabnine: Supported Agent'
  'visual-studio-code-bin: Visual Studio Code'
  'windsurf: Supported Agent, IDE-based'
)
conflicts=('specify-cli-bin')
options=(!debug)
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('65d167cc268cae993f00cc0a0d15378f488d8c37a73348bf3f86471fefda8e6ac6104a8e0dd83cac8d43b4f2d03b91ba056c6ed6e514d6c000fa1798c06ebdb0')

build() {
  cd "spec-kit-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "spec-kit-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 -t "$pkgdir/usr/share/licenses/specify-cli/" LICENSE
  install -Dm644 -t "$pkgdir/usr/share/doc/specify-cli/" {AGENTS.md,CHANGELOG.md,CODE_OF_CONDUCT.md,CONTRIBUTING.md,DEVELOPMENT.md,README.md,README.zh-CN.md,SECURITY.md,SUPPORT.md,spec-driven.md}
}
