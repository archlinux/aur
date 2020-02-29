# Maintainer: Muflone http://www.muflone.com/contacts/english/
# Contributor: Simone Sclavi 'Ito' <darkhado@gmail.com>
# Contributor: Changaco <changaco@changaco.net>

pkgname=mbrola
epoch=1
pkgver=3.3
pkgrel=1
pkgdesc="A phoneme-to-audio converter used by many TTS (Text-to-speech) programs"
arch=('x86_64')
url="https://github.com/numediart/MBROLA"
license=('AGPL3')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/numediart/MBROLA/archive/${pkgver}.tar.gz")
sha256sums=('c01ded2c0a05667e6df2439c1c02b011a5df2bfdf49e24a524630686aea2b558')

build() {
  cd "MBROLA-${pkgver}"
  export CFLAGS="-march=x86-64 -mtune=generic -fstack-protector-strong -fno-plt"
  make
}

package() {
  cd "MBROLA-${pkgver}"
  # Install executable file
  install -m 755 -d "${pkgdir}/usr/bin"
  install -m 755 -t "${pkgdir}/usr/bin" "Bin/mbrola"
  # Install documentation files
  install -m 755 -d "${pkgdir}/usr/share/doc/${pkgname}"
  install -m 644 -t "${pkgdir}/usr/share/doc/${pkgname}" \
    "README.md" "Documentation/documentation301.html"
  install -m 755 -d "${pkgdir}/usr/share/doc/${pkgname}/LATEX"
  install -m 644 -t "${pkgdir}/usr/share/doc/${pkgname}/LATEX" \
    "Documentation/LATEX"/*
}

