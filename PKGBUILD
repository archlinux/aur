#!/usr/bin/env bash
# -*- mode: sh; mode: sh-bash -*-
# shellcheck disable=SC2034,SC2154,SC2164

# Maintainer: Ricardo Zanetti <zanetti@engineer.com>

pkgname='colab-cli'

pkgver='0.6.0'

pkgrel=1

pkgdesc='A command-line interface for Google Colab'

arch=('any')

url='https://github.com/googlecolab/google-colab-cli'

license=('Apache-2.0')

depends=(
    'jupyter-nbformat'
    'python'
    'python-click'
    'python-filelock'
    'python-google-auth'
    'python-google-auth-oauthlib'
    'python-html2text'
    'python-jupyter-kernel-client'
    'python-packaging'
    'python-prompt_toolkit'
    'python-pydantic'
    'python-pygments'
    'python-requests'
    'python-rich'
    'python-typer'
    'python-typing_extensions'
    'python-websocket-client'
)

makedepends=('python-installer')

source=(
    "google_colab_cli-$pkgver-py3-none-any.whl::https://files.pythonhosted.org/packages/f0/c1/86a6ecbce96a1889bd7743664095a7af8e67b6a095596b5f4fdba8c41a4b/google_colab_cli-$pkgver-py3-none-any.whl"
)

sha256sums=('46d1aa45811d1ceea82e009e4c7bcd2bdf8dd2ab5c4238c7ccb83e6a52e1f75b')

# See also:
#   https://github.com/rzanetti/google-colab-cli
#   https://github.com/googlecolab/google-colab-cli
#   https://pypi.org/project/google-colab-cli
package() {
    python -m installer \
        --destdir="$pkgdir" \
        "google_colab_cli-$pkgver-py3-none-any.whl"

    _license=$(find "$pkgdir/usr/lib" -path '*dist-info/licenses/LICENSE' \
        | head -n1)

    install -Dm644 \
        "$_license" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
