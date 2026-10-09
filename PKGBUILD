# Maintainer: 
# Contributor: Julien Nicoulaud <julien.nicoulaud@gmail.com>
pkgname=subliminal
pkgver=2.7.1
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
sha256sums=('f2649914d3067904effa2b4ce8d83aae994cd47008253311d5ae7949f467939f')
sha512sums=('63bcd79112fbb9fbdbfef0b5cfabd06142df2cea93bafdb9f8da11d2fcf94ab79faa8c6230083a3574ac04a1f579061c8140504225310c0be92a34d7f5e3150e')
b2sums=('4bde34be38389c8022af7cd84b09f6eea897b83869d3858b4ca12abfad8580fcd47c73ed2dab3c3be1c1dcd04e0958b102a7918a032ab76cdddd25d410b690fd')

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
