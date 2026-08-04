# Maintainer: Yakov Till <yakov.till@gmail.com>

pkgname=jtool2
pkgver=2.0.2
pkgrel=1
pkgdesc="Mach-O binary inspection utility combining otool, nm, atos, dyldinfo, segedit, pagestuff and codesign functionality"
arch=('x86_64')
url="http://www.newosxbook.com/tools/jtool.html"
license=('LicenseRef-jtool2')
depends=('glibc')
options=('!debug')

# Upstream ships no license file in any artifact; the terms exist only as prose on
# the url= page. Nothing is installed under /usr/share/licenses rather than
# synthesizing a text upstream never wrote, so namcap's missing-license-file error
# on this package is expected and unfixable here.

# Upstream publishes a single unversioned URL and replaces the binary in place,
# so the version lives only in a string inside the payload.
_dlurl="https://www.newosxbook.com/files/jtool2.ELF64"

source=("${pkgname}-${pkgver}::${_dlurl}")
sha256sums=('29c48c21911c18dd8b91f5e07cac37b7f8c02dbbb1ee27da999497695ee3e3d1')

latestver() {
    curl -fsSL "$_dlurl" |
        grep -aoE 'PROGRAM: JTool [0-9.]+' |
        head -1 |
        sed 's/^PROGRAM: JTool //'
}

package() {
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}" "${pkgdir}/usr/bin/${pkgname}"
}
