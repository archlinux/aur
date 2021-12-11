# Maintainer: Isabella Basso do Amaral <isabbasso at riseup dot net>

_pkgname=kworkflow
_lpkg="${_pkgname,,}"
pkgname="${_pkgname}-git"
pkgver=0.5.r88.gf984b81
pkgrel=1
pkgdesc='CLI tool for kernel development'
arch=('x86_64')
url='https://github.com/kworkflow/kworkflow'
source=("git+https://github.com/kworkflow/kworkflow")
license=('GPL2')
depends=(bc qemu bash git tar libpulse python-virtualenv
	 bzip2 lzip lzop zstd xz
	 perl-authen-sasl perl-io-socket-ssl)
optdepends=('pipewire-pulse: PipeWire backend'
	    'pulseaudio: PulseAudio backend'
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
