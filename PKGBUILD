# Maintainer: Kian Kasad (kdkasad@gmail.com)
pkgname=chirp-daily-latest
pkgver=20200603
pkgrel=1
pkgdesc="Latest build of Chirp - a GUI tool for programming ham radios"
arch=('any')
url="https://chirp.danplanet.com/"
license=('GPL3')
depends=('python2-lxml' 'python2-pyserial' 'pygtk')
optdepends=('hamradio-menus')
options=(!emptydirs)
conflicts=(chirp)
provides=(chirp)
sha1sums=(SKIP)
source=("https://trac.chirp.danplanet.com/chirp_daily/LATEST/chirp-daily-${pkgver}.tar.gz")

pkgver() {
	curl -s https://trac.chirp.danplanet.com/chirp_daily/LATEST/ | grep -o 'chirp-daily-202[0-9]\{5\}\.tar\.gz' | sed 's/chirp-daily-//; s/\.tar\.gz//; 1q'
}

prepare() {
	echo "${sha1sums}"
}

build() {
  tar xvf ${pkgname}-${pkgver}.tar.gz
}

package() {
  cd "${pkgname}-${pkgver}"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
}
