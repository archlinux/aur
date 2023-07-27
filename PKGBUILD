# Maintainer: Thomas Haider <t.haider@deprecate.de>
# Contributor: Bjoern Franke  <bjo@nord-west.org>

pkgbase=dnssec-reverb-git
pkgname=dnssec-reverb
pkgver=r30.9aa8e24
pkgrel=1
pkgdesc="Shell script based DNSSEC key management tool"
arch=('any')
url="https://github.com/northox/dnssec-reverb"
license=('Simplified BSD')
optdepends=('dnssec-tools: DNSSEC tools for BIND'
	    'ldns: tools for NSD')
makedepends=('git')
backup=('etc/dnssec-reverb.conf' 'etc/dnssec-reverb.conf-bind')
source=("${pkgname}::git+https://github.com/northox/${pkgname}.git"
        "dateformat.patch"
        "rootcheck.patch")
md5sums=('SKIP'
         '8d7cb4088b45171ec9c3b64f95785464'
         '172c4bc58fce6706259ace9b9d068e8f')

pkgver() {
    cd "${srcdir}/${pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/${pkgname-git}"
    git apply ${srcdir}/dateformat.patch
    git apply ${srcdir}/rootcheck.patch
}

package() {
  cd "${srcdir}/${pkgname}"
 install -D dnssec-reverb "${pkgdir}/usr/bin/dnssec-reverb"
 install -d "${pkgdir}/etc/"
 install -D -m644 *.conf* "${pkgdir}/etc/" 
}

