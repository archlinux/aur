# Maintainer: Isabella Basso do Amaral <isabbasso at riseup dot net>

_pkgname=kworkflow
_lpkg="${_pkgname,,}"
pkgname="${_pkgname}-git"
_basepkgver=0.5.0
pkgver=0.5.8206878
pkgrel=3
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
sha512sums=('SKIP')
#install=kw.install

pkgver() {
  cd "$_pkgname"
  echo "${_basepkgver}_$(git describe --always)"
}

prepare() {
  cd "$_pkgname"
  git checkout unstable
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
