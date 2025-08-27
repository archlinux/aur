# Maintainer: envolution
# Contributor: Carl Smedstad <carsme@archlinux.org>
# shellcheck shell=bash disable=SC2034,SC2154
pkgname=python-instructor
_pkgname=${pkgname#python-}
pkgver=1.11.2
pkgrel=1
pkgdesc="Structured outputs for LLMs"
arch=(any)
url="https://github.com/jxnl/instructor"
license=(MIT)
depends=(
  python
  python-aiohttp
  python-docstring-parser
  python-httpx
  python-jiter
  python-openai
  python-pydantic
  python-regex
  python-rich
  python-tenacity
  python-typer
  python-typing_extensions
  python-jinja
  python-grpcio
  python-google-genai
  python-mistralai
)
makedepends=(
  python-build
  python-installer
  python-poetry
  python-wheel
  python-hatchling
)
optdepends=(
  'python-anthropic: support for Anthropic models'
  'python-cohere: support for Cohere models'
  'python-google-generativeai: support for Google Gemini models'
  'python-writerai: Writer authenticates your API requests using your account’s API keys.'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('b0da5f89d5c92502cf6abeb2a75dc0ddfe99f057c92303e33bdd56e1a23e296c')

_archive="$_pkgname-$pkgver"

build() {
  cd "$_archive"

  python -m build --wheel --no-isolation
}

package() {
  cd "$_archive"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
# vim:set ts=2 sw=2 et:
