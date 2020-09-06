# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname='youtube_tool'
pkgname="${_pkgname/_/-}"
pkgver=1.0.5
pkgrel=1
pkgdesc='CLI tool to extract comments, subtitles or livechat content from a youtube video'
arch=('any')
url='https://github.com/nlitsme/youtube_tool'
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
provides=('yttool')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz"
        "${_pkgname}-${pkgver}-LICENSE::${url}/raw/master/LICENSE")
sha256sums=('ae8490dfdc41260cc9e1c53356a61954d10b34651150245730ff244eb584f9eb'
            'SKIP')

build() {
  cd "${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  install -Dm644 "${_pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  cd "${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" 'README.md'
}

# vim: ts=2 sw=2 et:
