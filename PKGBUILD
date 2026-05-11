# Maintainer: Mark Collins <tera_1225 hat hotmail dote com>
pkgname=owasp-core-ruleset
_name=coreruleset
pkgver=4.26.0
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
sha256sums=('c07ccf0def1f9406a1e4c3abbf0d560a089c30994fb466ed9a69e9499c8288f7'
            'c1a834e94d3e9228da5c8faad1ec2ff2d76bd62dc3a77770d20bd505960e8861'
            '5e4500ef82e45c49d8edd9513648939710d6c8cc2d5997513b32866dc5d9be23'
            '185172d4dafa4c1cc2fad1748801326d6bb4270d441c717daac1f7184f746b1f')

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
