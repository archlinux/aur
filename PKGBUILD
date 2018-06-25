# Maintainer: Wesley Moore <wes@wezm.net>

pkgname=adr-tools
pkgver=2.1.0
pkgrel=1
pkgdesc='CLI tool for working with Architecture Decision Records'
arch=('any')
url='https://github.com/npryce/adr-tools'
license=('GPL3')
depends=('bash')
source=("https://github.com/npryce/adr-tools/archive/${pkgver}.tar.gz")
sha256sums=('1ef028cfeaa1b262a5c62845aa8965be169705370983f9ff73b17ec77bf75f70')

package() {
  rm "${srcdir}/${pkgname}-${pkgver}/src/adr-config"
  cat << EOF > "${srcdir}/${pkgname}-${pkgver}/src/adr-config"
#!/usr/bin/bash
echo 'adr_bin_dir="/usr/lib/${pkgname}"'
echo 'adr_template_dir="/usr/share/${pkgname}"'
EOF

  cd "${srcdir}/${pkgname}-${pkgver}/src"

  install -Dm0644 -t "${pkgdir}/usr/share/${pkgname}" *.md
  install -Dm0755 -t "${pkgdir}/usr/lib/${pkgname}" _adr*
  install -m0755 adr-* "${pkgdir}/usr/lib/${pkgname}"
  install -Dm0755 adr "${pkgdir}/usr/bin/adr"
  install -Dm0755 adr-config "${pkgdir}/usr/bin/adr-config"
}
