# Maintainer: 
# Contributor: Julien Nicoulaud <julien.nicoulaud@gmail.com>
pkgname=subliminal
pkgver=2.6.0
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
sha256sums=('e6e7aee1b218d543dcb3b7b2248ea0f92afc4c223ce3e7af8d2c3843e31bafe5')
sha512sums=('a53165822579edbe742d70a4898d85083f3d49b9d7e2f766e23d292293b588d7ca4aa5ec989654e3a0a1bfafb59fb379eaad240a9e14ec142c8330cbeb3e81e5')
b2sums=('b2b89a66c4c6e09598d039cdec87c849b47205b502cd7b0ce684ee2380e6f57cb81659299686e46b666eb9aff0d7ecedeae144df5c523b105abd11c1c1044e7e')

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
