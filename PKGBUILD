# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_author=conan-io
_basename=conan
pkgname=${_basename}-bin
pkgver=2.16.0
pkgrel=1
pkgdesc="A distributed, open source, C/C++ package manager."
arch=('x86_64' 'aarch64')
url="https://conan.io"
_github_url="https://github.com/${_author}/${_basename}"
_github_urlraw="https://raw.githubusercontent.com/${_author}/${_basename}/${pkgver}"
license=('MIT')
conflicts=("${_basename}")
provides=("${_basename}")
makedepends=('tar')
depends=('zlib' 'glibc' 'libxcrypt-compat')
source=("LICENSE-${pkgver}::${_github_urlraw}/LICENSE.md"
        "README-${pkgver}.md::${_github_urlraw}/README.md")
source_x86_64=("${_github_url}/releases/download/${pkgver}/${_basename}-${pkgver}-amd64.deb")
source_aarch64=("${_github_url}/releases/download/${pkgver}/${_basename}-${pkgver}-arm64.deb")
sha256sums=('cb0cfe10fad4eeb3ec0c1482474ddae67dcf2b2715cfd58655f6d18e5ce92aac'
            '366ea37eea2441b885aa01304bd30a90b5c93680c58f91e7cf3a2a238f6370b5')
sha256sums_x86_64=('8a94610101a9720d7babec44b4692c2f69ea970a50548e4bba02520c44d466a6')
sha256sums_aarch64=('9eb57393dab2a15a888b9afad1c76b8993d05828fc1299773c36d3d834c9a6b7')

package() {
    cd "${pkgdir}" || return 1

    # this extracts all into the pkgdir
    tar -xf "${srcdir}/data.tar.xz"

    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "usr/share/licenses/${pkgname}/LICENSE"

    install -Dm644 "${srcdir}/README-${pkgver}.md" "usr/share/doc/${pkgname}/README.md"
} 
