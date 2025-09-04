# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_author=conan-io
_basename=conan
pkgname=${_basename}-bin
pkgver=2.20.1
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
sha256sums_x86_64=('96ba50faf306702df78dc0fe821d1d57f6d037f0f16f5fae023f514b07c3f543')
sha256sums_aarch64=('c404c5dbf21cc5ba3da3069f30114a7de5b321bb0890826ba36980129f7ae858')

package() {
	cd "${srcdir}/" || return 1

	mkdir -p "${pkgdir}/opt/${_basename}"
	cp -raf "bin" "${pkgdir}/opt/${_basename}/"

	mkdir -p "${pkgdir}/usr/bin"
	ln -rsf "${pkgdir}/opt/${_basename}/bin/${_basename}" "${pkgdir}/usr/bin/${_basename}"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
