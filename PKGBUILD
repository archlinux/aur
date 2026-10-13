# Maintainer: 
# Contributor: Julien Nicoulaud <julien.nicoulaud@gmail.com>
pkgname=subliminal
pkgver=2.8.0
pkgrel=1
pkgdesc="Python library and CLI tool for searching and downloading subtitles."
arch=(any)
url="https://github.com/Diaoul/subliminal"
license=('MIT')
depends=('python-guessit>=3.0.0'
         'python-babelfish>=0.6.1'
         'python-knowit>=0.5.5'
         'python-platformdirs>=3'
         'python-beautifulsoup4>=4.4.0'
         'python-pysubs2>=1.7'
         'python-requests>=2.0'
         'python-click>=8.0'
         'python-click-option-group>=0.5.6'
         'python-dogpile.cache>=1.0'
         'python-stevedore>=3.0'
         'python-chardet>=5.0'
         'python-srt>=3.5'
         'python-tomlkit>=0.13.2'
         'python-rarfile>=2.7')
makedepends=('git'
             'python-build'
             'python-hatch-vcs'
             'python-hatchling'
             'python-installer'
)
source=("https://github.com/Diaoul/subliminal/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('0d784e621d0fa7d173f75798427b3572d4ab071a90bc0b9a8a88f1925670f691')
sha512sums=('0e9f8340f8ffd16f3fb6f77fe7c58e2d2a33ddef059dbfbed4a7f9298a8afeef2486247616d1bc293631623fad1e405191d736b4dc8dc08ff5815f4eb630a03e')
b2sums=('18ff79d19c8eb10b5c62dd61cdc374d526f05f4218204cfb2ade3af60c949e9b738e2b425e80c333913a9e9902f9b05490d47d06286ff68fbdf848bdf7c85d09')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -v -m755 -d "${pkgdir}/usr/share/licenses/subliminal"
  install -v -m644 ./LICENSE "${pkgdir}/usr/share/licenses/subliminal/"
}
