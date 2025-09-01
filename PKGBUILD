# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_author=conan-io
_basename=conan
pkgname=${_basename}-bin
pkgver=2.20.0
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
source_x86_64=("${_github_url}/releases/download/${pkgver}/${_basename}-${pkgver}-linux-x86_64.tgz")
source_aarch64=("${_github_url}/releases/download/${pkgver}/${_basename}-${pkgver}-linux-aarch64.tgz")
sha256sums=('cb0cfe10fad4eeb3ec0c1482474ddae67dcf2b2715cfd58655f6d18e5ce92aac'
            '366ea37eea2441b885aa01304bd30a90b5c93680c58f91e7cf3a2a238f6370b5')
sha256sums_x86_64=('8bc52b083c8efaf86308db508ad3b9079063900c90ad5881b83428492e348ba0')
sha256sums_aarch64=('6f19152f1b988bf2e5b0a29b5e14a3f6ed2d0b4a1d958444fd7fc3fdf1f595b8')

package() {
	cd "${srcdir}/" || return 1

	mkdir -p "${pkgdir}/opt/${_basename}"
	cp -raf "bin" "${pkgdir}/opt/${_basename}/"

	mkdir -p "${pkgdir}/usr/bin"
	ln -rsf "${pkgdir}/opt/${_basename}/bin/${_basename}" "${pkgdir}/usr/bin/${_basename}"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
