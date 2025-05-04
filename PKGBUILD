# Maintainer: 
# Contributor: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>
# Contributor: Nikola Milinković <nikmil@gmail.com>
# Contributor: Quentin Stievenart <quentin.stievenart@gmail.com>

pkgname=subliminal-git
pkgver=2.3.0.r0.ga25afe59
pkgrel=1
pkgdesc="Python library and CLI tool for searching and downloading subtitles."
arch=('any')
url="https://github.com/Diaoul/subliminal"
license=('MIT')
depends=('python-guessit>=3.0.0'
         'python-babelfish>=0.6.1'
         'python-knowit>=0.5.5'
         'python-platformdirs>=3'
         'python-beautifulsoup4>=4.4.0'
         'python-defusedxml>=0.7.1'
         'python-pysubs2>=1.7'
         'python-requests>=2.0'
         'python-click>=8.0'
         'python-click-option-group>=0.5.6'
         'python-dogpile.cache>=1.0'
         'python-stevedore>=3.0'
         'python-chardet>=5.0'
         'python-srt>=3.5'
         'python-tomlkit>=0.13.2'
         'python-rarfile>=2.7'
)
makedepends=('git' 'python-build' 'python-installer'
             'python-sphinxcontrib-programoutput' 'python-sphinx_rtd_theme' 'python-wheel'
             'python-sphinx-autodoc-typehints' 'towncrier' 'python-sphinx'
             'python-hatchling' 'python-hatch-vcs')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/Diaoul/subliminal.git#branch=main')
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/${pkgname%-git}"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/${pkgname%-git}"
    python -m installer --destdir="$pkgdir" dist/*.whl

    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/${pkgname%-git}"
}

