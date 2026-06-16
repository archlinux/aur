#!/usr/bin/env bash
# -*- mode: sh; mode: sh-bash -*-
# shellcheck disable=SC2034,SC2154,SC2164

# Maintainer: Ricardo Zanetti <zanetti@engineer.com>

pkgname='colab-cli'

pkgver='0.5.11'

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
    "google_colab_cli-$pkgver-py3-none-any.whl::https://files.pythonhosted.org/packages/25/8e/885494224c28099412972d11143d652e92d5dabfe6707526c5a5eda11840/google_colab_cli-$pkgver-py3-none-any.whl"
)

sha256sums=('750c881bdbe41c1de40767ad55055f6c30aac054f0f5d741087b6a01d54f54d4')

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
