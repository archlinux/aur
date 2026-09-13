# Maintainer: Jason Go <jasongo@jasongo.net>

pkgname=specify-cli
pkgver=1.0.6
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
b2sums=('897844ff2053fae47ad90e7c50d03bb316006c00ed4fa5692f1ea7cfd9a73fbcb04d1b5c7b21ec01629b0215a7cda93f2e35a0a03036199f45ea65509e3cd113')

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
