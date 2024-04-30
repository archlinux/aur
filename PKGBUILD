# Maintainer: MoetaYuko <loli at yuko dot moe>
# Contributor: Joakim Repomaa <aur@j.repomaa.com>

pkgname=python-yalafi
pkgver=1.5.0
pkgrel=1
pkgdesc="Yet another LaTeX filter"
url="https://github.com/torik42/YaLafi"
depends=('python' 'languagetool')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
license=('GPL3')
arch=('any')
source=(
	"https://github.com/torik42/YaLafi/archive/$pkgver.zip"
	"ltdirectory.patch"
)
sha256sums=('54b2a347875ded37edc1db04f7d836704514f216bbb6a9d62e732a9d525e276d'
            'ff59913ed6c4cc63dcf47f9604d5a096bd30e152f14e36ec53fa1e37793e5c10')

prepare() {
	cd YaLafi-$pkgver
	patch -p1 <"$srcdir/ltdirectory.patch"
}

build() {
	cd YaLafi-$pkgver
	python -m build --wheel --no-isolation
}

package() {
	cd YaLafi-$pkgver
	python -m installer --destdir="$pkgdir" dist/*.whl
}
