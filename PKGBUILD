# Maintainer: Chris Oelmueller <chris.oelmueller@gmail.com>
# Contributor: Thomas Kinnen <thomas.kinnen@gmail.com>
# Contributor: Biginoz <biginoz _at_ free point fr>
# Contributor: andy123 < ajs AT online DOT de >
# Contributor: Deather <deather.jeuxlinux@gmail.com>
# Contributor: Ronan Rabouin <darkbaboon@gmail.com>
pkgname=unknown-horizons
pkgver=2013.3
pkgrel=6
pkgdesc="2D realtime strategy simulation with an emphasis on economy and city building."
arch=('i686' 'x86_64')
url="http://www.unknown-horizons.org/"
license=('GPL' 'CCPL')
depends=('fife>=0.3.5' 'python2' 'python2-pillow' 'python2-yaml')
makedepends=('intltool')
conflicts=('unknown-horizons-svn' 'unknown-horizons-git')
source=("https://github.com/${pkgname}/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.xz")
md5sums=('2417cb88c12a0f855c96743c7f3287d0')
sha256sums=('18c2fd62365e40f6bb06b0a3c4106fff592bac249c3f498d49442f5dc217e37d')

prepare() {
	# Patch new Fife version expecting bool (not int) for logging parameters
	cd "$srcdir/$pkgname"
	sed -i -e 's@\(self._setting.get(SETTINGS.FIFE_MODULE, "LogToPrompt",\) "0"@\1 False@' "horizons/engine/engine.py"
	sed -i -e 's@\(self._setting.get(SETTINGS.FIFE_MODULE, "LogToFile",\) "0"@\1 False@' "horizons/engine/engine.py"
}

package() {
	cd "$srcdir/$pkgname"
	python2 setup.py --quiet install --root="$pkgdir" --optimize=1
}
