# Maintainer: Antonio Leal <antonioleal@yahoo.com>
pkgname=zxbasic
pkgver=1.18.5
pkgrel=1
pkgdesc="Basic compiler for ZX Spectrum"
arch=('x86_64')
url="https://github.com/boriel-basic/zxbasic"
license=('GPL-3.0-or-later')
depends=(python)
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!debug)
install=
source=(https://github.com/boriel-basic/zxbasic/archive/v${pkgver}/zxbasic-${pkgver}.tar.gz)
noextract=()
sha256sums=('d24bc6f63b72ef6c5b7f5603a3a7e365fe0220c6f1945c62901f1dc9b8fae169')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  rm -rf .github .gitattributes .gitignore
  cd ..
  mkdir -p "${pkgdir}/opt/"
  mv "${pkgname}-${pkgver}" "${pkgdir}/opt/"

  mkdir -p "${pkgdir}/usr/bin"
  cat << EOF > "${pkgdir}/usr/bin/zxbc"
#!/bin/bash
python3 /opt/${pkgname}-${pkgver}/zxbc.py "\$@"
EOF
  chmod +x "${pkgdir}/usr/bin/zxbc"

  cat << EOF > "${pkgdir}/usr/bin/zxbasm"
#!/bin/bash
python3 /opt/${pkgname}-${pkgver}/zxbasm.py "\$@"
EOF
  chmod +x "${pkgdir}/usr/bin/zxbasm"

  cat << EOF > "${pkgdir}/usr/bin/zxbpp"
#!/bin/bash
python3 /opt/${pkgname}-${pkgver}/zxbpp.py "\$@"
EOF
  chmod +x "${pkgdir}/usr/bin/zxbpp"
}
