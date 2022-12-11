# Maintainer: Sick Codes <info at sick dot codes>
pkgname=ca0132-tools-git
_pkgname=${pkgname%-git}
pkgver=r114.6c1563c
pkgrel=1
pkgdesc="Tools for the ca0132 HDA codec. Includes an assembler/disassembler for the integrated custom DSP."
arch=('any')
url="https://github.com/Conmanx360/ca0132-tools"
license=('GPL2')
provides=(${pkgname})
depends=()
optdepends=()
makedepends=()
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/${_pkgname}"
    make
}

package() {

  EXECUTABLES=(ca0132-send-dsp-scp-cmd
ca0132-get-chipio-stream-ports
ca0132-get-chipio-stream-data
ca0132-get-chipio-flags
ca0132-frame-dump-formatted
ca0132-dsp-op-test
ca0132-dsp-disassembler
ca0132-dsp-assembler
ca0132-chipio-write-data-from-file
ca0132-chipio-write-data
ca0132-chipio-read-to-file
ca0132-8051-write-exram
ca0132-8051-read-exram-to-file
ca0132-8051-command-line
ca0132-chipio-read-data
ca0132-8051-write-exram-from-file
ca0132-8051-read-exram
ca0132-8051-dump-state)

  for EXE in "${EXECUTABLES[@]}"; do
    install -Dm755 "${srcdir}/${_pkgname}/${EXE}" "${pkgdir}/usr/bin/${EXE}"
  done
}

