# Maintainer: Carlo Capocasa <carlo@capocasa.net>
# Maintainer: Peter Sutton <peter@foxdogstudios.com>
# Contributor: amiguet <contact at matthieuamiguet dot ch>
# Based on python2-pyo by amiguet

pkgname=python-pyo
pkgver=1.0.6
pkgrel=1
pkgdesc='Python DSP module'
arch=('x86_64')
url="http://ajaxsoundstudio.com/software/pyo/"
license=('GPL')
depends=(
	'python'
	'portmidi'
	'portaudio'
	'liblo'
	'libsndfile'
)
makedepends=(
	'git'
	'python-setuptools'
)
optdepends=(
	'wxpython: wxWidgets GUI'
)
provides=("pyo=$pkgver" "python-pyo=$pkgver")
conflicts=('pyo')
source=("https://codeload.github.com/belangeo/pyo/tar.gz/$pkgver"
        'gcc-14.patch')
sha512sums=('277ec569501ac72a42cfe6700ada27bd2c6614d009938c8cf1df16a23bc637cbd27884f7a2e2784b482850c6623b77585dded64e7b44253d15d7776d77da8ad3'
            'fe9222a604ccf43f04a21f6c6a3ac55f70fcf13e6001700ddb72efcc0a87c859a105a7d9fc1205c9339792e70d03e510b2812f599681af444c20a2278c5cd48f')

prepare() {
  cd "$srcdir"/pyo-"$pkgver"
  git --git-dir=.git apply "$srcdir"/gcc-14.patch
}

build() {
  cd "$srcdir"/pyo-"$pkgver"
  python setup.py build --use-double --use-jack
}

package() {
  cd "$srcdir"/pyo-"$pkgver"
  python setup.py install --use-double --use-jack --root="$pkgdir"/
}
