# Maintainer: coldbug <coldBug@e.mail.de>
pkgname=dr14_t.meter-git
pkgver=v1.0.15.r190.g9a22d1a
pkgrel=1
pkgdesc="DR14 T.meter is a command line tool for computing the Dynamic Range of your music"
arch=(any)
url="https://github.com/simon-r/dr14_t.meter"
license=('GPL3')
depends=('python' 'flac' 'lame' 'faad2' 'ffmpeg' 'vorbis-tools' 'python-numpy' 'python-mutagen')
optdepends=('python-matplotlib: plot support for python' 'python-scipy: dyn compression')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}" "dr14_tmeter")
source=('dr14_t.meter::git+https://github.com/simon-r/dr14_t.meter.git#branch=master')
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/${pkgname%-git}"
    python setup.py build
}

package() {
	cd "$srcdir/${pkgname%-git}"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
