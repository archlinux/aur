# Maintainer: Agustin Carrasco <asermax@gmail.com>

_pkgname=plannotator-tui
pkgname=plannotator-tui-bin
pkgver=0.5.0
pkgrel=1
pkgdesc="Annotate Markdown in the terminal: select, comment, looks-good, delete; send the review to your agent"
arch=('x86_64' 'aarch64')
url="https://github.com/plannotator/plannotator-tui"
license=('MIT')
depends=('gcc-libs' 'glibc')
provides=('plannotator-tui')
conflicts=('plannotator-tui' 'plannotator-tui-git')
source_x86_64=("${_pkgname}-x86_64-v${pkgver}::${url}/releases/download/v${pkgver}/${_pkgname}-x86_64-unknown-linux-gnu")
source_aarch64=("${_pkgname}-aarch64-v${pkgver}::${url}/releases/download/v${pkgver}/${_pkgname}-aarch64-unknown-linux-gnu")
sha256sums_x86_64=('5b3d8ca3e76410a5fcd87b3ea2564e304a63e7df9d306d2c5c22edcb1e0425ce')
sha256sums_aarch64=('5e12b8620cb5c01b7ab3c716fdca531dc56d451b7ae1aa9d4f483861098f9336')

latestver() {
  curl -s "https://api.github.com/repos/plannotator/plannotator-tui/releases/latest" | \
    grep '"tag_name":' | sed -E 's/.*"v([^"]+)".*/\1/' || true
}

package() {
  install -Dm755 "${_pkgname}-${CARCH}-v${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"

  # Shipped inline rather than as a source entry: a pkgver-scoped LICENSE URL would
  # add a second hash to sha256sums_x86_64, and the n8n bumper's sed only rewrites
  # single-line sha256sums arrays.
  install -Dm644 /dev/stdin "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" << 'EOF'
MIT License

Copyright (c) 2026 Michael Ramos

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
EOF
}
