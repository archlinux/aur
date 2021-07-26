# Maintainer: Joshua Ward <joshuaward@myoffice.net.au>
# Contributer: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname='youtube_tool'
pkgname="${_pkgname/_/-}"

pkgver=1.0.5
pkgrel=3
_commit_license='dff77ede5e0e26a0484b129f8a0e6e2bb2666c41'

pkgdesc='CLI tool to extract comments, subtitles or livechat content from a youtube video'
arch=('any')
url='https://github.com/nlitsme/youtube_tool'
_url_pypi='https://pypi.org/project/youtube-tool'
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz"
        "${_pkgname}-license-${_commit_license}::${url}/raw/${_commit_license}/LICENSE")
sha256sums=('ae8490dfdc41260cc9e1c53356a61954d10b34651150245730ff244eb584f9eb'
            '0da65eba47a76f4bc99941574553775328a906e04347f9bdcf9ae72e93d30860')

build() {
  cd "${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  install -Dvm644 "${_pkgname}-license-${_commit_license}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  cd "${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dvm644 'README.md' -t "${pkgdir}/usr/share/doc/${pkgname}"
}

# vim: ts=2 sw=2 et:
