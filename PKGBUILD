# Maintainer: Lucki <https://aur.archlinux.org/account/Lucki>
# Contributor: Chris Oelmueller <chris.oelmueller@gmail.com>
# Contributor: Thomas Kinnen <thomas.kinnen@gmail.com>
# Contributor: Biginoz <biginoz _at_ free point fr>
# Contributor: andy123 < ajs AT online DOT de >
# Contributor: Deather <deather.jeuxlinux@gmail.com>
# Contributor: Ronan Rabouin <darkbaboon@gmail.com>

pkgname=unknown-horizons
pkgver=2019.1
pkgrel=3
pkgdesc="2D realtime strategy simulation with an emphasis on economy and city building."
arch=('any')
url="http://www.unknown-horizons.org/"
license=('GPL' 'CCPL')
changelog=.CHANGELOG
depends=('fife' 'python-pillow' 'python-yaml' 'python-future')
makedepends=('intltool' 'python-setuptools')
conflicts=('unknown-horizons-git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/$pkgname/$pkgname/archive/$pkgver.tar.gz")
sha512sums=('87ae37442ee0b80130c7a75c7eeb7c0ef6c50f3e6b2616db32e6381ace5068729ab7086edefc00eefd3b89e85f9a05fb6c4d05f2a2adc46fa928e5c2a29b72db')

# unknown-horizons build system misses a few files if the build step is seperated from the install
# step
build() {
    cd "$srcdir/$pkgname-$pkgver"
    # UH_USER_DIR="$srcdir/UH_USER_DIR" python setup.py build
    UH_USER_DIR="$srcdir/UH_USER_DIR" python horizons/engine/generate_atlases.py 2048
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    UH_USER_DIR="$srcdir/UH_USER_DIR" python setup.py install --root="$pkgdir/" --optimize=1 #--skip-build
}
