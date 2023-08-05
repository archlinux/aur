# Maintainer: Bipin Kumar <kbipinkumar@pm.me>

pkgname=nanostat
_module=NanoStat
pkgver=1.6.0
pkgrel=1
pkgdesc="Create statistic summary of an Oxford Nanopore read dataset"
url="https://github.com/wdecoster/nanostat"
depends=(
         'python'
         'python-pandas'
         'nanomath'
         'nanoget'
        )

makedepends=(
             'python-setuptools'
             'python-wheel'
             'python-build'
             'cython'
             'python-installer'
            )
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz"
"https://raw.githubusercontent.com/wdecoster/nanostat/master/LICENSE")
sha256sums=('e45fa8d1ab49bdaed17596c26c0af148b44e4af46238391a8bb7a1b4cc940079'
            '8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903')

build() {
  cd $_module-${pkgver}
  python -m build --wheel --no-isolation
}

package() {
  cd $_module-${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 ${srcdir}/"LICENSE" -t "$pkgdir/usr/share/licenses/${pkgname}"
}
