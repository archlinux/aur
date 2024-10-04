# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="clipse"
pkgname="${_pkgname}-bin"
pkgver=1.1.0
pkgrel=1
pkgdesc="A configurable TUI clipboard manager for Unix"
arch=('x86_64' 'aarch64' 'i686')
url="https://github.com/savedra1/${_pkgname}"
license=('MIT')
optdepends=('xclip: for X11 clipboard support'
            'wl-clipboard: for Wayland clipboard support')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
noextract=("${_pkgsrc}.tar.gz")
source_x86_64=("${_pkgsrc}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${_pkgsrc}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_arm64.tar.gz")
source_i686=("${_pkgsrc}-i686.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_386.tar.gz")
sha256sums_x86_64=('20adee3658e6757fabc0465f5abb8152f21d7997ade78faab1a55b243e01a8a8')
sha256sums_aarch64=('b157b811575791c76c2082838f7fb2d87f263d68ac458bd5b6a700172242f310')
sha256sums_i686=('4eec59eda1a10c01797e339a6924cbd4064fc9bab1c755a2eae3bc8c7d9f474f')

prepare() {
  cd "${srcdir}"
  mkdir -p "${srcdir}/${_pkgsrc}-${CARCH}"
  bsdtar -xzf "${_pkgsrc}-${CARCH}.tar.gz" -C "${srcdir}/${_pkgsrc}-${CARCH}"
}

package() {
  cd "${srcdir}/${_pkgsrc}-${CARCH}"
  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "README.md"   "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "LICENSE"     "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
