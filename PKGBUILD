# Maintainer: Jason Go <jasongo@jasongo.net>

pkgname=specify-cli
pkgver=0.13.0
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
  'git'
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
conflicts=(
  'spec-kit'
  'specify-cli-bin'
)
options=(!debug)
source=("git+$url.git#tag=v$pkgver")
b2sums=('769ad88e3b5377c62ab1f37aaafdeaa3b69ab62597cf15b8dc667684902c07b38be2a1f2a0ff1bd2a079cfe7ee34314d5025cbc162e9e0c848c90843ac02c789')

build() {
  cd spec-kit
  python -m build --wheel --no-isolation
}

package() {
  cd spec-kit
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 -t "$pkgdir/usr/share/licenses/specify-cli/" LICENSE
  install -Dm644 -t "$pkgdir/usr/share/doc/specify-cli/" {AGENTS.md,CHANGELOG.md,CODE_OF_CONDUCT.md,CONTRIBUTING.md,DEVELOPMENT.md,README.md,SECURITY.md,SUPPORT.md,spec-driven.md}
}
