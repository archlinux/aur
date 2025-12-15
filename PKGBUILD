# Maintainer: 
# Contributor: Julien Nicoulaud <julien.nicoulaud@gmail.com>
pkgname=subliminal
pkgver=2.5.0
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
sha256sums=('3c79507e9c304895fb41eb0039b11f5abcb9f77376fe550cb605932836dfadc3')
sha512sums=('41649e546ee37e506e1479040de9ada9e8e0812785946a04cb7e0d21768ede860c03f72f5868c77a180e1e1e1d72681b37f703683eb5fb5101cd50544d9d2f83')
b2sums=('b4ffe552ed11230d2f44239d4981c4f4cc2a225ba3a5e78b1a582a42da4a3840199a9f63f960f0e1f40b1aff1affba52a9eac95842ded794a26f3fd50fb7bae3')

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
