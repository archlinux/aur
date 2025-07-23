# Maintainer: Isabella Basso do Amaral <isabbasso at riseup dot net>

_pkgname=kworkflow
_lpkg="${_pkgname,,}"
pkgname="${_pkgname}-git"
pkgver=0.9.r0.g8358ca2e
pkgrel=1
pkgdesc='CLI tool for kernel development'
arch=('any')
url='https://github.com/kworkflow/kworkflow'
source=("git+https://github.com/kworkflow/kworkflow")
license=('GPL2')
depends=(bc ccache qemu bash git tar libpulse sqlite3 rsync pv
	 bzip2 lzip lzop zstd xz
	 perl-authen-sasl perl-io-socket-ssl python-virtualenv)
optdepends=('pulseaudio: PulseAudio backend'
	    'dunst: Desktop notifications support'
	    'graphviz: Pomodoro graphs support'
	    'librsvg: Pomodoro graphs support'
	    'imagemagick: Pomodoro graphs support'
	    'python-sphinx: Build docs'
	    'python-pip: Build docs'
	    'python-docutils: Build docs')
provides=("${_lpkg}")
conflicts=("${_lpkg}")
sha256sums=('SKIP')
install=kw.install

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$_pkgname"
  git checkout master
  #git checkout unstable
  git pull
}

#build() {
#  pip install sphinx-book-theme
#  ./setup.sh --docs
#}

package() {
  cd "$_pkgname"
  chmod +x setup.sh
  ./setup.sh --skip-checks -i
}
