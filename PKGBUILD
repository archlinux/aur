# Maintainer: Mark Collins <tera_1225 hat hotmail dote com>
pkgname=owasp-core-ruleset
_name=coreruleset
pkgver=4.29.0
pkgrel=1
pkgdesc="OWASP ModSecurity Core Rule Set"
arch=('any')
url="https://github.com/coreruleset/coreruleset/"
_modsec_url="https://github.com/owasp-modsecurity/ModSecurity/raw/refs/heads/v2/master/"
license=('Apache-2.0')
depends=(
  apache
  modsecurity # either libmodsecurity2 in AUR or libmodsecurity (v3) in extra
)
source=("${pkgname}-${pkgver}.zip::${url}/archive/refs/tags/v${pkgver}.zip"
	"mod_security_recommended.conf::${_modsec_url}/modsecurity.conf-recommended"
	"${_modsec_url}/unicode.mapping"
        "${pkgname}.install")
sha256sums=('2236b0249e7e299e5cce8c67c3c7e3eb2fea77b8cbcf3abc46eb7ee54071d84f'
            'de1bca07540d323ff103c08c9d0a9b0d7f14ac31502b5b3b62fc0f6dfecb829d'
            '5e4500ef82e45c49d8edd9513648939710d6c8cc2d5997513b32866dc5d9be23'
            '185172d4dafa4c1cc2fad1748801326d6bb4270d441c717daac1f7184f746b1f')
backup=('etc/httpd/conf/extra/mod_security_recommended.conf')

package() {
    mkdir -p "${pkgdir}/etc/httpd/conf"
    cp -r "${_name}-$pkgver" "${pkgdir}/etc/httpd/conf/owasp-modsecurity-crs"
    cd "${pkgdir}/etc/httpd/conf/owasp-modsecurity-crs"
    rm -fR \
      .changes-pending.md \
      .editorconfig \
      .github \
      .gitignore \
      .gitmodules \
      .linelint.yml \
      .pre-commit-config.yaml \
      .yamllint.yml \
      util \
      tests \
      docs
    mkdir "${pkgdir}/etc/httpd/conf/extra/"
    install -D "${srcdir}/mod_security_recommended.conf" "${pkgdir}/etc/httpd/conf/extra/"
    install -D "${srcdir}/unicode.mapping" "${pkgdir}/etc/httpd/conf/extra/"
}
