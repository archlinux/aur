# Maintainer: Chris Oelmueller <chris.oelmueller@gmail.com>
# Contributor: Thomas Kinnen <thomas.kinnen@gmail.com>
# Contributor: Biginoz <biginoz _at_ free point fr>
# Contributor: andy123 < ajs AT online DOT de >
# Contributor: Deather <deather.jeuxlinux@gmail.com>
# Contributor: Ronan Rabouin <darkbaboon@gmail.com>
pkgname=unknown-horizons
pkgver=2014.1
pkgrel=1
pkgdesc="2D realtime strategy simulation with an emphasis on economy and city building."
arch=('i686' 'x86_64')
url="http://www.unknown-horizons.org/"
license=('GPL' 'CCPL')
depends=('fife-git' 'python2' 'python2-pillow' 'python2-yaml')
makedepends=('intltool')
conflicts=('unknown-horizons-svn' 'unknown-horizons-git')
source=("https://github.com/${pkgname}/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.xz"
        "fix-atlas-overlays.diff::https://github.com/unknown-horizons/unknown-horizons/commit/405c514eab9e2abffe8d1a8912646447e6a29cfa.patch")
md5sums=('276ed6118eba6af615a286ff2989da6c'
         '19259e1a80873925aea281772f014be3')
sha256sums=('5f9dd483e81ad89bff1bc46739349ab531cc930830bf17ef390ac239940a236b'
            'e051fb7555d9478e06ee278856b27d1e0ef94cf88db9babdf0f903e5df03ef6f')

prepare() {
    cd "$srcdir/$pkgname"
    # Fix crash with color overlays if using atlases (the default)
    patch -p1 -i "${srcdir}/fix-atlas-overlays.diff"
}
package() {
    cd "$srcdir/$pkgname"
    python2 setup.py --quiet install --root="$pkgdir" --optimize=1
}
