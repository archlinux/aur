#!/usr/bin/env bash
# -*- mode: sh; mode: sh-bash -*-
# shellcheck disable=SC2034,SC2154,SC2164

# Maintainer: Ricardo Zanetti <zanetti@engineer.com>

pkgname='python-jupyter-kernel-client'

pkgver='0.9.0'

pkgrel=1

pkgdesc="Jupyter Kernel Client allows you to connect to live Jupyter Kernels through HTTP and WebSocket"

arch=('any')

url="https://github.com/datalayer/jupyter-kernel-client"

license=('BSD-3-Clause')

depends=(
    'python'
    'python-jupyter-client'
    'python-jupyter-core'
    'python-jupyter-mimetypes'
    'python-requests'
    'python-traitlets'
    'python-typing_extensions'
    'python-websocket-client'
)

optdepends=(
    'jupyter-console: interactive terminal console (REPL for kernels)'
    'python-numpy: for running the upstream test suite'
    'python-pandas: for running the upstream test suite'
    'python-pytest: for running the upstream test suite'
)

makedepends=('python-installer')

source=(
    "jupyter_kernel_client-$pkgver-py3-none-any.whl::https://files.pythonhosted.org/packages/7a/68/287315ba355aa93bda2e344de5febc45e6de1b47d8f4a5b69400b24cfdfd/jupyter_kernel_client-$pkgver-py3-none-any.whl"
)

sha256sums=('77acb8f2f738d97625d6bd01ee8cf21c4d59790b7ba464108712db3870416f20')

package() {
    python -m installer \
        --destdir="$pkgdir" \
        "jupyter_kernel_client-$pkgver-py3-none-any.whl"

    _license=$(find "$pkgdir/usr/lib" -path '*dist-info/licenses/LICENSE' \
        | head -n1)

    install -Dm644 \
        "$_license" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
