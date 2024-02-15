# Maintainer: Alex Pyattaev <alex pyattaev at google dot com>
pkgname='roc-nightly-bin'
_name='roc_nightly-linux_x86_64-latest'
pkgver=$( date +%Y%m%d )
pkgrel=6
pkgdesc='A fast, friendly, functional language. Work in progress!'
arch=('x86_64')
url='https://github.com/roc-lang/roc'
license=('UPL1.0')
dlname="${pkgname}-${pkgver}.tar.gz"
source=("${dlname}::https://github.com/roc-lang/roc/releases/download/nightly/${_name}.tar.gz")
md5sums=('SKIP')
depends=('glibc>=2.38' 'binutils>=2.41')


package() {
    dirname=`tar --list -f ${dlname} | head -n 1`
    echo "Using directory name ${dirname}"
    tar -xf ${dlname}
    install -Dm755 "${dirname}/roc" "${pkgdir}/usr/bin/roc"
    install -Dm755 "${dirname}/roc_language_server" "${pkgdir}/usr/bin/roc_language_server"
    install -Dm644 "${dirname}/LICENSE" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "${dirname}/LEGAL_DETAILS" "${pkgdir}/usr/share/licenses/$pkgname/LEGAL_DETAILS"
    cp -r "${dirname}/examples" "${pkgdir}/usr/share/roc/"
    cp -r "${dirname}/crates" "${pkgdir}/usr/share/roc/"
}
