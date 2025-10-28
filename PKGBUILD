# Maintainer: envolution
# Contributor: Carl Smedstad <carsme@archlinux.org>
# shellcheck shell=bash disable=SC2034,SC2154
pkgname=python-instructor
_pkgname=${pkgname#python-}
pkgver=1.12.0
pkgrel=1
pkgdesc="Structured outputs for LLMs"
arch=(any)
url="https://github.com/567-labs/instructor"
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
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('f0707a06bbae4a49de24e4a6f4fa4953cf2dfa915450dcc9aeecee3940e97f81')

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
