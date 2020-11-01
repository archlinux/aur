pkgname=arduino-cli-rc
_tagver="0.13.0"
pkgver="${_tagver%-*}"
pkgrel=1
pkgdesc="Arduino command line interface -- stable and release candidates"
arch=('x86_64')
url="https://github.com/arduino/arduino-cli"
license=('GPL3')
conflicts=('arduino-cli')
provides=('arduino-cli')
depends=('arduino-ctags')
makedepends=('go-pie' 'git' 'taskfile-git')
optdepends=('arduino-avr-core: AVR core with upstream avr-gcc and avrdude'
	   'arduino-builder: Arduino command line interface'
	   'arduino-ctags')
source=("https://github.com/arduino/arduino-cli/archive/${_tagver}.tar.gz")

sha512sums=('bb176b7057bd91a22fe2db2574c16107f8d0143725939276152510a1719ca91137eacbfbdd58e2c015e8a0137eb2f2e0e02ae08fc378acf0eb12044c02e7bd52')

build(){
  cd arduino-cli-${_tagver}
  task build
}

check(){
  cd arduino-cli-${_tagver}
  task test-unit
}

package() {
  cd arduino-cli-${_tagver}
  install -Dm 755 arduino-cli "$pkgdir"/usr/bin/arduino-cli

  # Install
  install -Dm644 -t "${pkgdir}/usr/share/arduino/hardware/" "legacy/builder/hardware/platform.keys.rewrite.txt"
}

